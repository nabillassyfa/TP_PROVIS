// import 'dart:ffi';

import '/cubit/produk_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ProdukCubit extends Cubit<ProdukModel> {
  final String url = "http://127.0.0.1:8000/detil_produk/";
  
  ProdukCubit() : super(ProdukModel(
    id: "",
    nama: "",
    deskripsi: "",
    kategori: "",
    img: "",
    harga: "",
    rating: 0,
    penjualan: 0,
  ));

  void setFromJson(Map<String, dynamic> json) {
    emit(ProdukModel.fromJson(json));
  }

  void fetchData(String id) async {
    final response = await http.get(Uri.parse(url + id));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}