import 'package:flutter/material.dart';
import 'package:projeto_ana/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sim",
      theme: ThemeData(fontFamily: 'Bucharest'),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
