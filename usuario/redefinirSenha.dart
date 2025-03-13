import 'package:flutter/material.dart';

//Telas
import 'package:shared_preferences/shared_preferences.dart';

class Redefinirsenha extends StatefulWidget {
  const Redefinirsenha({super.key});

  @override
  State<Redefinirsenha> createState() => _RedefinirsenhaState();
}

class _RedefinirsenhaState extends State<Redefinirsenha> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  String _errorMessage = "";
  bool _obscureText = true;
  bool acaoMouse = false;

  //Verificar se o login vai dar certo
  Future<void> _novaSenha() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final usuario = _usuarioController.text.trim();
    final senha = _senhaController.text.trim(); //senha nova

    //Necessário para os inputs não ficarem vazios
    if (usuario.isEmpty || senha.isEmpty) {
      setState(() {
        _errorMessage = "Preencha todos os campos ;)";
      });
    }

    final listaUsuarios =
        sharedPreferences.getStringList('listaUsuarios') ?? [];
    final listaSenhas = sharedPreferences.getStringList('listaSenhas') ?? [];

    //Necessário para percorrer toda a lista de usuários
    for (var i = 0; i < listaUsuarios.length; i++) {
      if (usuario == listaUsuarios[i]) {
        listaSenhas[i] = senha;
        await sharedPreferences.setStringList('listaSenhas', listaSenhas);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sua senha foi redefinida :)')),
        );
         Navigator.pop(context);
      } 
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
          icon: Icon(Icons.arrow_back_ios, color: Colors.brown),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    'https://i.pinimg.com/736x/33/dc/85/33dc853f8b7946e3bb6613b07eb9073a.jpg',
                    height: 500,
                  ),
                  Text(
                    'Esqueceu a senha?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '-Tudo bem, crie uma nova aqui:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 15),

                  //Input de nome de usuário
                  TextFormField(
                    controller: _usuarioController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Usuário...',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: Icon(Icons.person, color: Colors.brown[900]),

                      errorText: _errorMessage.isEmpty ? null : _errorMessage,
                    ),
                  ),

                  SizedBox(height: 20), //espaçamento
                  //Input de senha
                  TextFormField(
                    controller: _senhaController,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Nova senha...',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: Icon(Icons.vpn_key, color: Colors.brown[900]),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.brown[900],
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),

                      errorText: _errorMessage.isEmpty ? null : _errorMessage,
                    ),
                  ),

                  SizedBox(height: 20),

                  MouseRegion(
                    onEnter:
                        (_) => setState(
                          () => acaoMouse = true,
                        ), //quando selecionado
                    onExit:
                        (_) => setState(
                          () => acaoMouse = false,
                        ), //quando não selecionado

                    child: ElevatedButton(
                      onPressed: _novaSenha, //verificar a nova senha
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(110, 20),
                        backgroundColor:
                            acaoMouse
                                ? Colors.grey[600] //Se o acaoMouse == false
                                : Colors.grey[400], //Se o acaoMouse == true
                      ),
                      child: Text(
                        'Atualizar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
