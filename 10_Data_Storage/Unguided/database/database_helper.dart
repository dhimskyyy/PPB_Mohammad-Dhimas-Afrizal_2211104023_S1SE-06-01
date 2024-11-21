import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/student.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('student_biodata.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        nim TEXT NOT NULL,
        address TEXT NOT NULL,
        hobby TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertStudent(Student student) async {
    final db = await instance.database;
    return await db.insert('students', student.toMap());
  }

  Future<List<Student>> getAllStudents() async {
    final db = await instance.database;
    final result = await db.query('students');
    return result.map((map) => Student.fromMap(map)).toList();
  }
}