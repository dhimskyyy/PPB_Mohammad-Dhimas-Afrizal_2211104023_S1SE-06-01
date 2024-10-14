import 'package:flutter/material.dart';

class ListViewApp extends StatelessWidget {
  const ListViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Recommended Tourist Places'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> places = [
    {
      'name': 'Eiffel Tower',
      'location': 'Paris, France',
      'image':
          'https://cdn1.sisiplus.co.id/media/sisiplus/asset/uploads/artikel/g2OEbKl2aTEIp1x5hFNYEE9ad615uVenBexDAcVW.jpg'
    },
    {
      'name': 'Great Wall of China',
      'location': 'China',
      'image':
          'https://images.nationalgeographic.org/image/upload/t_edhub_resource_key_image/v1638892506/EducationHub/photos/the-great-wall-of-china.jpg'
    },
    {
      'name': 'Machu Picchu',
      'location': 'Peru',
      'image':
          'https://asset.kompas.com/crops/-0kUbM44VWEdaGoXSfe5xc3yRTA=/0x0:739x493/750x500/data/photo/2020/10/14/5f86abb8005a4.jpg'
    },
    {
      'name': 'Grand Canyon',
      'location': 'Arizona, USA',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/3/31/Canyon_River_Tree_%28165872763%29.jpeg'
    },
    {
      'name': 'Colosseum',
      'location': 'Rome, Italy',
      'image':
          'https://images.nationalgeographic.org/image/upload/t_edhub_resource_key_image/v1652340658/EducationHub/photos/colosseum.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: places.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                // Displaying image from URL
                Image.network(
                  places[index]['image']!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  title: Text(places[index]['name']!),
                  subtitle: Text(places[index]['location']!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}