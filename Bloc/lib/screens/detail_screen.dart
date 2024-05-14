import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bloc/cubit/produk_cubit.dart';
import 'package:tp_bloc/cubit/produk_state.dart';

class DetailProdukPage extends StatelessWidget {
  final String produkId;

  DetailProdukPage({required this.produkId});

  @override
  Widget build(BuildContext context) {
    context.read<ProdukCubit>().fetchData(produkId);

    return BlocBuilder<ProdukCubit, ProdukModel>(
      builder: (context, produkDetail) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 158, 181),
            elevation: 1,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Detail',
              style: TextStyle(color: Colors.black),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: produkDetail.id.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(produkDetail.imageUrl),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        produkDetail.nama,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Color.fromARGB(255, 255, 235, 239),
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              'Rp ${produkDetail.harga}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        color: Color.fromARGB(255, 255, 235, 239),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                for (int i = 0; i < 5; i++)
                                  Icon(
                                    Icons.star,
                                    color: i < produkDetail.rating ? Colors.yellow : Colors.grey,
                                  ),
                                const SizedBox(width: 8),
                                Text(
                                  produkDetail.rating.toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${produkDetail.penjualan} Terjual',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Color.fromARGB(255, 255, 235, 239),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deskripsi",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              produkDetail.deskripsi,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.bottomCenter,
                        color: Color.fromARGB(255, 255, 235, 239),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Color.fromARGB(255, 255, 133, 162),
                                    size: 30,
                                  ),
                                  Text(
                                    "add to cart",
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 255, 133, 162),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 190,
                                height: 60,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    color: Color.fromARGB(255, 255, 133, 162)),
                                child: const Center(
                                  child: Text(
                                    "Beli",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
