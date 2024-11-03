class Product {
  final int id;
  final String name;
  final double harga;
  final String imgUrl;
  final String deskripsi;

  Product(
      {required this.id,
      required this.name,
      required this.harga,
      required this.imgUrl,
      required this.deskripsi,});

  // Method untuk convert JSON ke object Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      harga: json['harga'].toDouble(),
      imgUrl: json['imgUrl'],
      deskripsi: json['deskripsi'],
    );
  }

  // Method untuk convert object Product ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'harga': harga,
      'imgUrl': imgUrl,
      'deskripsi': deskripsi,
    };
  }
}