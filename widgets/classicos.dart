import 'package:flutter/material.dart';

import 'package:projeto_ana/carrinho/produto.dart';
import 'package:projeto_ana/carrinho/provider.dart';
import 'package:provider/provider.dart';

class Classicos extends StatelessWidget {
  const Classicos({super.key}); // Adicionando o construtor correto

  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<CarrinhoProvider>(context);

    final List<Produto> produtos = [
      Produto(
        nome: "Expresso",
        imagem:
            "https://i.pinimg.com/736x/38/1b/b1/381bb16a17c065be110d5074cefe85ea.jpg",
        descricao: 'Simples e gostoso',
        preco: 7,
      ),
      Produto(
        nome: "Cappuccino",
        imagem:
            "https://i.pinimg.com/236x/aa/58/db/aa58db1f67f7a048ea74029c59bb6adb.jpg",
        descricao: 'Um bom clássico',
        preco: 10,
      ),
      Produto(
        nome: "Macchiato",
        imagem:
            "https://i.pinimg.com/736x/d5/6a/6e/d56a6e256b74640a554ce96e7001d42e.jpg",
        descricao: 'Equilíbrio de sabores',
        preco: 12,
      ),
    ];

    return Column(
      children:
          produtos.map((produto) {
            return Column(
              children: [
               Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown,
                  blurRadius: 3, //desfoque
                  offset: Offset(4, 10), //direção
                ),
              ],
            ),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            
             mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                   produto.imagem,
                    height: 100,
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        produto.nome,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        produto.descricao,
                        style: TextStyle(color: Colors.brown, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                
                Column(
                  children: [
                   IconButton(onPressed: (){
                    carrinho.adicionarAoCarrinho(produto);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${produto.nome} está no carrinho ;)",
                                ),
                              ),
                            );
                   }, icon: Icon(Icons.add_circle, size: 30, color: Colors.brown,)),
                    SizedBox(height: 10),
                    Text( "R\$ ${produto.preco}", style: TextStyle(color: Colors.green)),
                  ],
                ),
              ],
            ),
          ),

                SizedBox(
                  height: 25,
                ),
              ],
            );
          }).toList(),
    );
  }
}
