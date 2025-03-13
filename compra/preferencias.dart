import 'package:flutter/material.dart';
import 'package:projeto_ana/compra/localizacao.dart';
import 'package:projeto_ana/widgets/checkBoxCompra.dart';

class Preferencias extends StatefulWidget {
  const Preferencias({super.key});

  @override
  State<Preferencias> createState() => _PreferenciasState();
}

class _PreferenciasState extends State<Preferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.brown),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Image.network(
                'https://i.pinimg.com/736x/0a/6d/a2/0a6da2c65dd05a51cb21e8c5c8425cff.jpg',
              ),

              Transform.translate(
                offset: Offset(0, -80),
                child: Text(
                  'Escolha suas preferências:',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              Transform.translate(
                offset: Offset(0, -50),
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(154, 118, 92, 0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.brown, width: 2),

                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(154, 118, 92, 0.7),
                          offset: Offset(10, 10),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                    ),

                    child: Column(
                      children: [
                        Row(
                          children: [
                            CheckBoxCompra(
                              activeColor: Color.fromRGBO(154, 118, 92, 0.5),
                            ),
                            Text(
                              'Com açúcar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 100),
                            Text(
                              '*',
                              style: TextStyle(fontSize: 25, color: Colors.red),
                            ),
                          ],
                        ),
                        Divider(color: Colors.brown),
                        Row(
                          children: [
                            CheckBoxCompra(
                              activeColor: Color.fromRGBO(154, 118, 92, 0.5),
                            ),
                            Text(
                              'Sem açúcar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.brown),
                        Row(
                          children: [
                            CheckBoxCompra(
                              activeColor: Color.fromRGBO(154, 118, 92, 0.5),
                            ),
                            Text(
                              'Com adoçante',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(154, 118, 92, 0.7),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.brown, width: 2),

                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(154, 118, 92, 0.7),
                        offset: Offset(10, 10),
                        blurRadius: 1,
                        spreadRadius: 0,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Row(
                        children: [
                          CheckBoxCompra(
                            activeColor: Color.fromRGBO(154, 118, 92, 0.5),
                          ),
                          Text(
                            'Quente',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 140),
                          Text(
                            '*',
                            style: TextStyle(fontSize: 25, color: Colors.red),
                          ),
                        ],
                      ),
                      Divider(color: Colors.brown),
                      Row(
                        children: [
                          CheckBoxCompra(
                            activeColor: Color.fromRGBO(154, 118, 92, 0.5),
                          ),
                          Text(
                            'Gelado',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(154, 118, 92, 0.7),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.brown, width: 2),

                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(154, 118, 92, 0.7),
                        offset: Offset(10, 10),
                        blurRadius: 1,
                        spreadRadius: 0,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Row(
                        children: [
                          CheckBoxCompra(
                            activeColor: Color.fromRGBO(154, 118, 92, 0.5),
                          ),
                          Text(
                            'Com canudo',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 100),
                          Text(
                            '*',
                            style: TextStyle(fontSize: 25, color: Colors.red),
                          ),
                        ],
                      ),
                      Divider(color: Colors.brown),
                      Row(
                        children: [
                          CheckBoxCompra(
                            activeColor: Color.fromRGBO(154, 118, 92, 0.5),
                          ),
                          Text(
                            'Sem canudo',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Localizacao()),
                  );
                },
                child: Text(
                  'Próximo passo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}