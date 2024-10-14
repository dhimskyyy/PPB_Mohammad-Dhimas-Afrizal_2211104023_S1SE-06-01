import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridviewApp(),
    );
  }
}

class GridviewApp extends StatefulWidget {
  const GridviewApp({super.key});

  @override
  State<GridviewApp> createState() => _GridviewAppState();
}

class _GridviewAppState extends State<GridviewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('praktikum 4'),
          backgroundColor: const Color.fromARGB(255, 138, 171, 255),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: EdgeInsets.all(12),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('Gridview 1'),
                  Icon(Icons.ac_unit),
                ],
              ),
              color: const Color.fromARGB(255, 224, 199, 109),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Icon(Icons.add),
                  Text('Gridview 2'),
                ],
              ),
              color: const Color.fromARGB(255, 151, 227, 231),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Gridview 3'),
              color: const Color.fromARGB(255, 152, 232, 195),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Gridview 4'),
              color: const Color.fromARGB(255, 212, 155, 167),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Gridview 5'),
              color: const Color.fromARGB(255, 250, 149, 255),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Gridview 6'),
              color: const Color.fromARGB(255, 209, 220, 135),
            ),
          ],
        ));
  }
}