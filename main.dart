import 'package:flutter/material.dart';


import 'package:projeto_ana/carrinho/provider.dart';
import 'package:projeto_ana/usuario/login.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => CarrinhoProvider(),
    child: MaterialApp(
      theme: ThemeData(
        fontFamily: 'Anonymous'
      ),
      debugShowCheckedModeBanner: false,
      title: 'CofCof',
      home: Login(),
    )
    );
  }
}
