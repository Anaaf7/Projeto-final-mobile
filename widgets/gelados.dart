import 'package:flutter/material.dart';

import 'package:projeto_ana/carrinho/produto.dart';
import 'package:projeto_ana/carrinho/provider.dart';
import 'package:provider/provider.dart';

class Gelados extends StatelessWidget {
  const Gelados({super.key}); // Adicionando o construtor correto

  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<CarrinhoProvider>(context);

    final List<Produto> produtos = [
      Produto(
        nome: "Friaca",
        imagem:
            "https://i.pinimg.com/736x/36/a4/6d/36a46de353ed8cda166705f0c7eb996b.jpg",
        descricao: 'Ideal para o calorzão',
        preco: 19,
      ),
      Produto(
        nome: "Cremoso",
        imagem:
            "https://i.pinimg.com/736x/1d/ef/45/1def45ce8f7cacba26b29ec94b37bfb8.jpg",
        descricao: 'Chantilly extra ;)',
        preco: 17,
      ),
      Produto(
        nome: "Nevado",
        imagem:
            "https://i.pinimg.com/736x/44/71/26/4471269f93bbcaf2e148ac8fc718a3b9.jpg",
        descricao: 'Equilíbrio de sabores',
        preco: 14,
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
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                   produto.imagem,
                    height: 100,
                    width: 100,
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        produto.nome,
                        textAlign: TextAlign.start,
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
