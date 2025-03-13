/*-----------------------------------------------------------------------
  Este código teve como base o repositório disponibilisado pelo 
  professor Gian na aula de shared preferences.
  Link: https://github.com/giancraft/exemplo-shared-preferences/tree/main
-------------------------------------------------------------------------*/

// Packages
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();
  bool _obscureText = true;

  Future<void> _cadastrar(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final usuario = _usuarioController.text.trim();
    final senha = _senhaController.text.trim();
    final confirmarsenha = _confirmarSenhaController.text.trim();

    if (usuario.isEmpty || senha.isEmpty || confirmarsenha.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Não esqueça de preencher todos os campos ;)'),
          ),
        );
      }
      return;
    }

    if (senha != confirmarsenha) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('As senhas não estão iguais ;)')),
        );
      }
      return;
    }

    List<String> listaUsuarios =
        sharedPreferences.getStringList('listaUsuarios') ?? [];
    List<String> listaSenhas =
        sharedPreferences.getStringList('listaSenhas') ?? [];

    if (listaUsuarios.contains(usuario)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Este usuário já existe ;)')),
        );
      }
      return;
    }

    listaUsuarios.add(usuario);
    listaSenhas.add(senha);

    await sharedPreferences.setStringList('listaUsuarios', listaUsuarios);
    await sharedPreferences.setStringList('listaSenhas', listaSenhas);
    await sharedPreferences.setString('usuario', usuario);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seu cadastro foi realizado!')),
      );
      Navigator.pop(context);
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
          icon: Icon(Icons.arrow_back_ios, color: Colors.brown,),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Image.asset('assets/cafederrubado.gif'),
                   
                  // Input de nome de usuário
                  TextFormField(
                    controller: _usuarioController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Usuário...',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: Icon(Icons.person, color: Colors.brown[900]),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Input do telefone do usuário
                  TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    decoration: InputDecoration(
                      hintText: '(  ) .... - ....',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: Icon(Icons.phone, color: Colors.brown[900]),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Input de senha
                  TextFormField(
                    controller: _senhaController,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Senha...',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: Icon(Icons.key_outlined),
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
                  ),
                  SizedBox(height: 20),
                  // Input de confirmação de senha
                  TextFormField(
                    controller: _confirmarSenhaController,
                    keyboardType: TextInputType.text,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Confirme a senha...',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: Icon(Icons.key_outlined),
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
                  ),
                  SizedBox(height: 20),
              
                  // Botão de Cadastro
                  ElevatedButton(
                    onPressed: () {
                      _cadastrar(context);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 20),
                      backgroundColor: Colors.brown,
                    ),
                    child: Text(
                      'Cadastrar-se',
                      style: TextStyle(color: Colors.white),
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
