class ProdukModel {
  ProdukModel({
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

  factory ProdukModel.fromJson(Map<String, dynamic> json) => ProdukModel(
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
    "harga": harga,
    "deskripsi": deskripsi,
    "kategori": kategori,
    "img": img,
    "rating": rating,
    "penjualan": penjualan,
  };
}
