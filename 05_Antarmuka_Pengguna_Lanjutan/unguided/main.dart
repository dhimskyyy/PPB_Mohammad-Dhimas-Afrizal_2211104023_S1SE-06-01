import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 150, 0, 0),
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              backgroundColor: const Color.fromARGB(255, 34, 138, 223),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
                title: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Wisata di Banyumas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/79/2024/10/09/Tinggalkan-Banyumas-Kota-Hasil-Pemekaran-yang-Memiliki-Kepadatan-Penduduk-2233-per-KM-persegi-Ini-Bakal-Jadi-Wilayah-Terluas-di-Jawa-Tengah-2469702952.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index < wisataImages.length &&
                      index < wisataTitles.length &&
                      index < wisataDescriptions.length) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(wisataTitles[index]),
                              content: Text(wisataDescriptions[index]),
                              actions: [
                                TextButton(
                                  child: const Text("Tutup"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.teal.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gambar wisata dengan CachedNetworkImage
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: wisataImages[index],
                                height: 200,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            // Nama dan Deskripsi Wisata
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    wisataTitles[index],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    wisataDescriptions[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(wisataTitles[index]),
                                            content: const Text(
                                                'Informasi lebih lanjut...'),
                                            actions: [
                                              TextButton(
                                                child: const Text("Tutup"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('Lihat Selengkapnya'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
                childCount: wisataTitles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Daftar gambar wisata
final List<String> wisataImages = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwBwAYW9PMHqQ_uM1Yr7otTFLmb5xgGSakMQ&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvq3f6dJ2l9euM8EC8-lnY7WLbf2wBSZSYjg&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH-1l7XQzDy4Rpd0W_K_A0KQop4TUDErt8Zg&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuLUz27VNWMGIfJr3pUvlYQoyJvQwJnVh9QA&s',
];

// Daftar title wisata
final List<String> wisataTitles = [
  'Baturaden',
  'Curug Cipendok',
  'Telaga Sunyi',
  'Taman Andhang Pangrenan',
];

// Daftar deskripsi wisata
final List<String> wisataDescriptions = [
  'Kecamatan Baturraden merupakan jalur menuju wisata di Kabupaten Banyumas menarik wisatawan maka tak heran setiap liburan Idul Fitri ataupun akhir tahun ramai bus pariwisata, mobil, motor, dan lain-lain.',
  'Curug Cipendok adalah air terjun dengan ketinggian 92 meter yang terletak di lereng Gunung Slamet.',
  'Telaga Sunyi berbentuk kolam air yang tidak begitu luas dengan kedalaman kurang lebih sampai 5 meter.',
  'Taman kota yang cocok untuk rekreasi keluarga dengan berbagai fasilitas umum yang menarik.',
];
