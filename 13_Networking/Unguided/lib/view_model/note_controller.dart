import 'package:get/get.dart';
import 'package:percobaan/models/note.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs; // Menyimpan daftar catatan

  // Fungsi untuk menambah catatan
  void addNote(String title, String description) {
    notes.add(Note(title: title, description: description));
  }

  // Fungsi untuk menghapus catatan berdasarkan index
  void deleteNote(int index) {
    notes.removeAt(index);
  }
}