import 'package:flutter/material.dart';
import 'flexible_expanded.dart'; // Tambahkan import ini

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FlexibleExpandedScreen(), // Pastikan ini sesuai dengan nama kelas di flexible_expanded.dart
    );
  }
}