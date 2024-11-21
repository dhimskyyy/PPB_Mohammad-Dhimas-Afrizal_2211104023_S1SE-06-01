import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/student.dart';
import '../widgets/student_form.dart';

class AddStudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Biodata Mahasiswa'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: StudentForm(
          onSubmit: (Student student) async {
            await DatabaseHelper.instance.insertStudent(student);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}