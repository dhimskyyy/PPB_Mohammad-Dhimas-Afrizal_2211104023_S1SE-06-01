import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ListViewApp(),
    );
  }
}

class ListViewApp extends StatefulWidget {
  const ListViewApp({super.key});

  @override
  State<ListViewApp> createState() => _ListViewAppState();
}

class _ListViewAppState extends State<ListViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan ListView'),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 255, 131, 122),
            child: Center(
              child: Text(("Type A")),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 164, 184, 255),
            child: Center(
              child: Text(("Type A")),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 240, 156, 255),
            child: Center(
              child: Text(("Type A")),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 149, 255, 188),
            child: Center(
              child: Text(("Type A")),
            ),
          ),
        ],
      ),
    );
  }
}