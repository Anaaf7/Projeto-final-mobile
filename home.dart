import 'package:flutter/material.dart';
import 'package:appbar_animated/appbar_animated.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:projeto_ana/compra/localizacao.dart';
import 'package:projeto_ana/widgets/redesSociais.dart';
import 'package:projeto_ana/widgets/sobre.dart';
import 'package:projeto_ana/widgets/suporte.dart';


//Telas


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   String categoriaSelecionada = 'sobre';

  // Necessário para controlar a rolagem da página
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys para identificar as seções
  final GlobalKey _sobre = GlobalKey();
  final GlobalKey _localizacao = GlobalKey();
  final GlobalKey _redesSociais = GlobalKey();

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
      body: ScaffoldLayoutBuilder(
        backgroundColorAppBar: const ColorBuilder(
          Colors.transparent,
          Colors.brown,
        ),
        textColorAppBar: const ColorBuilder(Colors.white),
        appBarBuilder: _AppBar,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
            children: [
              Image.network(
                "https://i.pinimg.com/736x/e9/11/e6/e911e6b2f33d61b79bdd4dacc7642713.jpg",
              ),
              Container(
                margin: EdgeInsets.only(top: 400),
                height: 800,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),

                  child: Column(
                    children: [
                      DelayedDisplay(
                        delay: const Duration(seconds: 1),
                        child: Text.rich(
                          TextSpan(
                            text: "Encontre \nsua dose de ",
                            style: TextStyle(fontSize: 45),
                            children: [
                              TextSpan(
                                text: "energia ",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 0.5,
                                ),
                              ),
                              TextSpan(text: "aqui!\n"),
                              TextSpan(
                                text: "-Cofcof",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  categoriaSelecionada == "sobre"
                                      ? Colors.brown
                                      : Colors.white,
                              side: BorderSide(color: Colors.brown),
                            ),
                            onPressed: () {
                              setState(() {
                                categoriaSelecionada = 'sobre';
                              });
                              _scrollToSection(_sobre);
                            },
                            child: Text(
                              'Sobre',
                              style: TextStyle(
                                color:
                                    categoriaSelecionada == 'sobre'
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
                                  categoriaSelecionada == 'localizacao'
                                      ? Colors.brown
                                      : Colors.white,
                              side: BorderSide(color: Colors.brown),
                            ),
                            onPressed: () {
                              setState(() {
                                categoriaSelecionada = 'localizacao';
                              });
                              _scrollToSection(_localizacao);
                            },
                            child: Text(
                              'Localização',
                              style: TextStyle(
                                color:
                                    categoriaSelecionada == 'localizacao'
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
                                  categoriaSelecionada == 'redesSocias'
                                      ? Colors.brown
                                      : Colors.white,
                              side: BorderSide(color: Colors.brown),
                            ),
                            onPressed: () {
                              setState(() {
                                categoriaSelecionada = 'redesSocias';
                              });
                              _scrollToSection(_redesSociais);
                            },
                            child: Text(
                              'Redes',
                              style: TextStyle(
                                color:
                                    categoriaSelecionada == 'redesSocias'
                                        ? Colors.white
                                        : Colors.brown,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Sobre(key: _sobre),
                      Localizacao(key: _localizacao),
                      Redessociais(key: _redesSociais),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _AppBar(BuildContext context, ColorAnimated colorAnimated) {
  return AppBar(
    backgroundColor: colorAnimated.background,
    elevation: 0,

    //Voltar para a tela anterior
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
    ),

    actions: [
      PopupMenuButton(
        icon: Icon(Icons.menu, color: Colors.white),

        onSelected: (value) {
          //Verificar se o usuário clicou em sair
          if (value == 'sair') {
            Navigator.pop(context);
          }
          //Verificar se o usuário clicou em suporte
          else if (value == 'suporte') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Suporte()),
            );
          }
        },
        itemBuilder:
            (BuildContext context) => [
              PopupMenuItem(value: 'sair', child: Text('Sair')),
              PopupMenuItem(value: 'suporte', child: Text('Suporte')),
            ],
      ),
    ],
  );
}
