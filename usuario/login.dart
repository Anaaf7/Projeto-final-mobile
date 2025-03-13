/*-----------------------------------------------------------------------
  Este código teve como base o repositório disponibilisado pelo 
  professor Gian na aula de shared preferences.
  Link: https://github.com/giancraft/exemplo-shared-preferences/tree/main
-------------------------------------------------------------------------*/

//Packages
import 'package:flutter/material.dart';
import 'package:projeto_ana/usuario/cadastro.dart';
import 'package:projeto_ana/usuario/redefinirSenha.dart';
import 'package:projeto_ana/widgets/navPages.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Telas


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  String _errorMessage = "";
  bool _obscureText = true;

  //Verificar se o login vai dar certo
  Future<void> _verificarLogin() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final usuario = _usuarioController.text.trim();
    final senha = _senhaController.text.trim();

    //Necessário para os inputs não ficarem vazios
    if (usuario.isEmpty || senha.isEmpty) {
      setState(() {
        _errorMessage = "Preencha todos os campos ;)";
      });
    } else {
      //Necessário para caso o usuário não seja encontrado
      setState(() {
        _errorMessage = "Não encontramos este usuário ou senha :(";
      });
    }

    final listaUsuarios =
        sharedPreferences.getStringList('listaUsuarios') ?? [];
    final listaSenhas = sharedPreferences.getStringList('listaSenhas') ?? [];

    //Necessário para percorrer toda a lista de usuários
    for (var i = 0; i < listaUsuarios.length; i++) {
      //Verificar se o usuário e senha são iguais
      if (usuario == listaUsuarios[i] && senha == listaSenhas[i]) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavPages(/*usuario: usuario*/)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            
              children: [
                Image.asset('assets/cafederrubado.gif'),
            
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
                    hintText: 'Senha...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.vpn_key, color: Colors.brown[900]),
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
            
                    errorText: _errorMessage.isEmpty ? null : _errorMessage,
                  ),
                ),
            
                //Botão de esqueceu a senha
                Transform.translate(
                  offset: Offset(0, -7),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Redefinirsenha(),
                            ),
                          );
                        },
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: 5), //espaçamento
                //Botão para ser redirecionado ao home
                ElevatedButton(
                  onPressed: _verificarLogin,
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 20),
                    backgroundColor: Colors.brown,
                  ),
            
                  child: Text('Logar', style: TextStyle(color: Colors.white)),
                ),
            
                SizedBox(height: 10,),

                //Botão de cadastro
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastro()),
                    );
                  },
                  child: Text(
                    'Não possuí uma conta?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
