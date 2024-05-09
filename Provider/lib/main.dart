import 'package:flutter/material.dart';
import 'product_widget.dart';
import 'provider/prov_barang.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider()..getProducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    elevation: 1,
    backgroundColor: Color.fromARGB(255, 1, 101, 255),
    title: const Text(
      'OStore',
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      Container(
        width: MediaQuery.of(context).size.width * 0.5, 
        child: TextField(
          decoration: InputDecoration(
            hintText: "Cari",
            hintStyle: TextStyle(color: Colors.grey.shade600),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade600,
              size: 20,
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.shade100,
              ),
            ),
          ),
        ),
      ),
      Stack(
        children: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 25,
            ),
          ),
          Positioned(
            top: 0,
            right: 3,
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: const Center(
                child: Text(
                  "2",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ],
  ),
        body: Consumer<ProductProvider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return ItemWidget(product: value.products[index]);
                },
                itemCount: value.products.length,
              ),
            );
          },
        )
        );
  }
}


