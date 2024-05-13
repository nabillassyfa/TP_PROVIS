import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str)['data'].map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.kategori,
    required this.img,
    required this.harga,
    required this.rating,
    required this.penjualan,
  });

  final String id;
  final String nama;
  final String deskripsi;
  final String kategori;
  final String img;
  final String harga;
  final double rating;
  final int penjualan;

  String get imageUrl => 'http://127.0.0.1:8000/produk_image/$id';

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        kategori: json["kategori"],
        img: json["img"],
        harga: json["harga"],
        rating: json["rating"].toDouble(),
        penjualan: json["penjualan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "kategori": kategori,
        "img": img,
        "harga": harga,
        "rating": rating,
        "penjualan": penjualan,
      };
}
