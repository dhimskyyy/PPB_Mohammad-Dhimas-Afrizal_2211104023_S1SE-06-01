import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percobaan/view_model/note_controller.dart';
import 'package:percobaan/view/add_note_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController controller = Get.put(NoteController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Catatan'),
      ),
      body: Obx(() {
        // Menampilkan daftar catatan
        if (controller.notes.isEmpty) {
          return const Center(
            child: Text('Tidak ada catatan'),
          );
        }
        return ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            final note = controller.notes[index];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(note.description),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  controller.deleteNote(index); // Menghapus catatan
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddNotePage()); // Navigasi ke halaman tambah catatan
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}