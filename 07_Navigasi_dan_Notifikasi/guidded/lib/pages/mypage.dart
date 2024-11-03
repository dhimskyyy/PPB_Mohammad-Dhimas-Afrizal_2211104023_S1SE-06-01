import 'package:flutter/material.dart';
import 'package:percobaan2/model/product.dart';
import 'package:percobaan2/pages/detail.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final List<Product> products = [
    Product(
      id: 1,
      name: 'Mouse',
      harga: 300000.00,
      imgUrl:
          'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
      deskripsi: 'Mouse Gaming Logitech G502X Plus',
    ),
    Product(
      id: 2,
      name: 'Keyboard',
      harga: 500000.00,
      imgUrl:
          'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot',
      deskripsi: 'Keyboard Mechanical Logitech MX Mechanical',
    ),
    Product(
      id: 3,
      name: 'Monitor',
      harga: 1000000.00,
      imgUrl:
          'https://m.media-amazon.com/images/I/61CGHv6kmWL._AC_UF894,1000_QL80_.jpg',
      deskripsi: 'Monitor Gaming LG UltraGear 27GL850',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Belajar class',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(
              product.imgUrl,
              width: 70,
              height: 70,
            ),
            title: Text(product.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Harga: ${product.harga.toString()}'),
                Text('Deskripsi: ${product.deskripsi}'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProduct(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}