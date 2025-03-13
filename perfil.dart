import 'package:flutter/material.dart';
import 'package:projeto_ana/usuario/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _logout(BuildContext context) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setBool('logado', false);
  await sharedPreferences.remove(
    'usuario',
  ); // Remover apenas o nome do usuário logado

  if (!context.mounted) return;

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const Login()),
  );
}

class Perfil extends StatefulWidget {

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // Voltar para a tela anterior
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.brown),
        ),
        actions: [
          IconButton(
            onPressed: () => _logout(context),

            icon: Icon(Icons.logout, color: Colors.brown),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Image.network(
                    'https://i.pinimg.com/736x/36/7a/63/367a638d0c50934d7353d2d48a6ebd4a.jpg',
                    width: 200,
                  ),
          
                  Text('User', style: TextStyle(fontSize: 30)),
                  Text('Perfil do usuário', style: TextStyle(color: Colors.grey)),
          
                  SizedBox(height: 30),
          
                  //Editar nome de usuário
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                       hintText: 'Nome de usuário...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.edit),
                    ),
                  ),
          
                  SizedBox(height: 20), //espaçamento
                  //Editar telefone do usuário
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Telefone...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: Icon(Icons.edit),
                    ),
                  ),
          
                  SizedBox(height: 20), //espaçamento
                  //Editar endereço do usuário
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Endereço...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.location_on),
                      suffixIcon: Icon(Icons.edit),
                    ),
                  ),
                  SizedBox(height: 20), //espaçamento
          
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(100, 20),
                      backgroundColor: Colors.brown,
                    ),
                    child: Text('Editar', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 20), //espaçamento
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
