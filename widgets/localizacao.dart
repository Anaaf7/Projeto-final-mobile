import 'package:flutter/material.dart';

class Localizacao extends StatefulWidget {
  const Localizacao({super.key});

  @override
  State<Localizacao> createState() => _LocalizacaoState();
}

class _LocalizacaoState extends State<Localizacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('LOcalizacao'),
        ],
      ),
    );
  }
}