//Package
import 'package:flutter/material.dart';
import 'package:projeto_ana/home.dart';
import 'package:projeto_ana/widgets/checkBoxCompra.dart';

class Pagamento extends StatefulWidget {
  const Pagamento({super.key});

  @override
  State<Pagamento> createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  bool _obscureText = true;

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
        child: Padding(padding: EdgeInsets.all(30), child: Column(
          children: [
            Image.network(
                'https://i.pinimg.com/736x/80/95/d2/8095d23eb73fbb06741044ef66a67bb5.jpg',
                height: 300,
              ),

              Transform.translate(
                offset: Offset(0, -60),
                child: Text(
                  'Forma de pagamento:',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              Transform.translate(
                offset: Offset(0, -40),
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
                              'Pix',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 160),
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
                              'Dinheiro',
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
                              'Cartão débito/crédito',
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

              SizedBox(height: 30,),
              Divider(color: Colors.brown, thickness: 3,),
              SizedBox(height: 30,),

              Image.network('https://i.pinimg.com/736x/00/9e/6b/009e6b97a206daeddc5489118bb83967.jpg'),

               Container(
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
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 40,
                    right: 40,
                  ),
                  child: TextFormField(
                obscureText: _obscureText,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Nº do cartão...',
                  hintStyle: TextStyle(color:Colors.white),
                  prefixIcon: Icon(Icons.credit_card, color: Colors.brown[900]),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.brown[900],
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
        
                 
                ),
              ),),
                ),
Text('nome, validade, cvv, cp'),
              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text(
                  'Finalizar pedido',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),),
      ),
    );
  }
}