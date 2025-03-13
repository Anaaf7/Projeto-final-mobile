//Packages
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projeto_ana/home.dart';
import 'package:projeto_ana/loja.dart';
import 'package:projeto_ana/perfil.dart';


//Telas


class NavPages extends StatefulWidget {
  const NavPages({super.key});

  @override
  State<NavPages> createState() => _NavPagesState();
}

class _NavPagesState extends State<NavPages> {
  
  int _currentIndex = 0; //necessário para saber qual página irá mostrar

  // Telas em que o usuário vai poder navegar 
  final List<Widget> _pages = [
    Home(),
    Loja(),
    Perfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.brown,),
          Icon(Icons.store, size: 30,color: Colors.brown,),
          Icon(Icons.person, size: 30,color: Colors.brown,),
        ],
        color: Color.fromARGB(255, 230, 227, 227),
          buttonBackgroundColor:const Color.fromARGB(255, 223, 223, 223),
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
         onTap: (index) {
          setState(() {
            _currentIndex = index; //necessário para saber qual página irá mostrar
          });
        },
      ),
    );
  }
}
