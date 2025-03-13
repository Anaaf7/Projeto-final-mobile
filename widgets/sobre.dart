import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  const Sobre({super.key});

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        height: 30,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(154, 118, 92, 0.7),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.brown, width: 2),

                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(154, 118, 92, 0.7),
                      offset: Offset(10, 7),
                      blurRadius: 1,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Image.asset('assets/mapCof.jpg'),
      ),
    );
  }
}