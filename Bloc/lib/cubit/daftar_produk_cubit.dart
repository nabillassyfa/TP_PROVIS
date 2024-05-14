import 'package:tp_bloc/cubit/produk_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdukListCubit extends Cubit<List<ProdukModel>> {
  final String url = "http://127.0.0.1:8000/daftar_produk";
  
  ProdukListCubit() : super([]);

  void setFromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(json['data']); 
    List<ProdukModel> produkList = data.map((e) => ProdukModel.fromJson(e)).toList();
    emit(produkList);
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}