//Packages
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:projeto_ana/carrinho/carrinho.dart';

import 'package:projeto_ana/widgets/classicos.dart';
import 'package:projeto_ana/widgets/especiais.dart';
import 'package:projeto_ana/widgets/gelados.dart';

//Telas


class Loja extends StatefulWidget {
  const Loja({super.key});

  @override
  State<Loja> createState() => _LojaState();
}

class _LojaState extends State<Loja> {
  //Necessário para o título
  final Duration initialDelay = Duration(seconds: 1);

  //Começar com a categoria clássicos
  String categoriaSelecionada = 'classicos';

  // Necessário para controlar a rolagem da página
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _classicosKey = GlobalKey();
  final GlobalKey _geladosKey = GlobalKey();
  final GlobalKey _especiaisKey = GlobalKey();

  //Necessário para ir até a categoria selecionada
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      //animação
      Scrollable.ensureVisible(
        context,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Carrinho()),
              );
            },
            icon: Icon(Icons.shopping_cart, color: Colors.brown, size: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              DelayedDisplay(
                delay: const Duration(seconds: 1),
                child: Text(
                  'Cofcof shop',
                  style: TextStyle(
                    color: Colors.brown[800],
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DelayedDisplay(
                delay: const Duration(seconds: 1 + 1),
                child: Transform.translate(
                  offset: Offset(0, -10),
                  child: Text(
                    'Aceita um cafézinho?',
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          categoriaSelecionada == "classicos"
                              ? Colors.brown
                              : Colors.white,
                      side: BorderSide(color: Colors.brown),
                    ),
                    onPressed: () {
                      setState(() {
                        categoriaSelecionada = 'classicos';
                      });
                      _scrollToSection(_classicosKey);
                    },
                    child: Text(
                      'Clássico',
                      style: TextStyle(
                        color:
                            categoriaSelecionada == 'classicos'
                                ? Colors.white
                                : Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          categoriaSelecionada == 'gelados'
                              ? Colors.brown
                              : Colors.white,
                      side: BorderSide(color: Colors.brown),
                    ),
                    onPressed: () {
                      setState(() {
                        categoriaSelecionada = 'gelados';
                      });
                      _scrollToSection(_geladosKey);
                    },
                    child: Text(
                      'Gelado',
                      style: TextStyle(
                        color:
                            categoriaSelecionada == 'gelados'
                                ? Colors.white
                                : Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          categoriaSelecionada == 'especiais'
                              ? Colors.brown
                              : Colors.white,
                      side: BorderSide(color: Colors.brown),
                    ),
                    onPressed: () {
                      setState(() {
                        categoriaSelecionada = 'especiais';
                      });
                      _scrollToSection(_especiaisKey);
                    },
                    child: Text(
                      'Especial',
                      style: TextStyle(
                        color:
                            categoriaSelecionada == 'especiais'
                                ? Colors.white
                                : Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              //Necessário para chamar os widgets das categorias
              Classicos(key: _classicosKey),
              Gelados(key: _geladosKey),
              Especiais(key: _especiaisKey),

              
            ],
          ),
        ),
      ),
    );
  }
}
