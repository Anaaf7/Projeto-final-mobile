//Packages
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_ana/compra/pagamento.dart';
import 'package:projeto_ana/widgets/checkBoxCompra.dart';



class Localizacao extends StatefulWidget {
  const Localizacao({super.key});

  @override
  State<Localizacao> createState() => _LocalizacaoState();
}

class _LocalizacaoState extends State<Localizacao> {
  //Variavel para exibir o cep
  String resultado =
      "Seu CEP será mostrado aqui ;)"; //vai armazenar o resultado da busca do cep na API

  //Obter o cep digitado pelo usuário
  TextEditingController cepUsuario = TextEditingController();

  void buscaCep() async {
    //receber o cep do usuário
    String cep = cepUsuario.text;

    //Informar ao flutter a API sendo usada (via cep) para que ele possa usa-la
    String url = 'https://viacep.com.br/ws/$cep/json/';

    //Armazenar a resposta da requisição http
    http.Response response; //variavel que vai receper a resquisição

    //Utilizando o método GET, fazer a requizição para a URL do via cep
    response = await http.get(Uri.parse(url));

    //print('Resposta: '+ response.body);

    //print('Status code: '+ response.statusCode.toString());

    //Exibir o Cep fornecido pelo usuario
    Map<String, dynamic> dados = jsonDecode(response.body);

    //Obter cada detalhe do endereço armazenando nas variaveis
    String logradouro = dados['logradouro'];
    String complemento = dados['complemento'];
    String bairro = dados['bairro'];
    String localidade = dados['localidade'];

    //Exibir para o usuario o resultado da busca do cep

    String endereco =
        'Verifique se este é seu CEP: $logradouro, $complemento, $bairro, $localidade';

    setState(() {
      resultado = endereco;
    });
  }

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
                'https://i.pinimg.com/736x/bf/c6/0b/bfc60bc5e81b45b665553798a665d182.jpg',
                height: 300,
              ),
              Transform.translate(
                offset: Offset(0, -50),
                child: Text(
                  'Sobre a entrega:',
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
                              'Em casa',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 130),
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
                              'Retirar no balcão',
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

              TextFormField(
                controller: cepUsuario,
                keyboardType: TextInputType.number,
                maxLength: 8,
                decoration: InputDecoration(
                  hintText: 'Digite seu cep',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(Icons.location_on, color: Colors.brown[900]),
                ),
              ),

              TextButton(
                onPressed: buscaCep,
                child: Text('Consultar', style: TextStyle(color: Colors.black, decoration: TextDecoration.underline)),
              ),

              SizedBox(height: 15),

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
                  child: Text(resultado, style: TextStyle(color: Colors.white)),
                ),
              ),

              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pagamento()),
                  );
                },
                child: Text(
                  'Próximo passo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),),
      )
    );
  }
}