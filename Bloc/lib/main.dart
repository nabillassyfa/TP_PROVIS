import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/daftar_produk_cubit.dart';
import '../cubit/produk_cubit.dart';
import '../screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ProdukListCubit>(
            create: (_) => ProdukListCubit(),
          ),
          BlocProvider<ProdukCubit>(
            create: (_) => ProdukCubit(),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
