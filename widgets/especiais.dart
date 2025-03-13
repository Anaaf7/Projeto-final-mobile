import 'package:flutter/material.dart';

import 'package:projeto_ana/carrinho/produto.dart';
import 'package:projeto_ana/carrinho/provider.dart';
import 'package:provider/provider.dart';

class Especiais extends StatelessWidget {
  const Especiais({super.key}); // Adicionando o construtor correto

  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<CarrinhoProvider>(context);

    final List<Produto> produtos = [
      Produto(
        nome: "Cofcats",
        imagem:
            "https://i.pinimg.com/736x/51/3c/1a/513c1ad6f54e97b7a6c52d91d552b16b.jpg",
        descricao: 'Explosão de gatos',
        preco: 30,
      ),
      Produto(
        nome: "DogCof",
        imagem:
            "https://i.pinimg.com/736x/58/9e/7c/589e7c5e0b8ce83961dac65730ed8d65.jpg",
        descricao: 'Energia renovada',
        preco: 25,
      ),
      Produto(
        nome: "Aconchego",
        imagem:
            "https://i.pinimg.com/736x/2c/66/ef/2c66ef06978d9e35b5d0c786249814d6.jpg",
        descricao: 'Café do bom dia',
        preco: 20,
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
