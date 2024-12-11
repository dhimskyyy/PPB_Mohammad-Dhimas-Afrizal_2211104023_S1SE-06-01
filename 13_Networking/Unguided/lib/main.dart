import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percobaan/view/home_page.dart';
import 'package:percobaan/view/add_note_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/addNote', page: () => const AddNotePage()),
      ],
    );
  }
}