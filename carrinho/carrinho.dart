import 'package:flutter/material.dart';
import 'package:projeto_ana/carrinho/produto.dart';
import 'package:projeto_ana/carrinho/provider.dart';
import 'package:provider/provider.dart';
import 'package:delayed_display/delayed_display.dart';

class Carrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<CarrinhoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.brown,),
        ),
      ),
      body:
          carrinho.itens.isEmpty
              ? Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DelayedDisplay(
                        delay: const Duration(seconds: 1+1),
                        child: Text(
                          'Aqui só tem um gatinho :(',
                          
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      DelayedDisplay(
                         delay: const Duration(seconds: 1),
                        child: Image.network(
                        'https://i.pinimg.com/736x/6e/d0/e1/6ed0e169cb41457c391a660dbdfcc31b.jpg',
                        height: 200,
                      ),)
                    ],
                  ),
                ),
              )
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: carrinho.itens.length,
                      itemBuilder: (context, index) {
                        final Produto produto = carrinho.itens[index];
                        return Container(
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
                    carrinho.limparCarrinho();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Item excluído!",
                                ),
                              ),
                            );
                   }, icon: Icon(Icons.remove_circle, size: 30, color: Colors.brown,)),
                    SizedBox(height: 10),
                    Text( "R\$ ${produto.preco}", style: TextStyle(color: Colors.green)),
                  ],
                ),
                
              ],
            ),
          );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "O valor da sua compra: R\$ ${carrinho.total.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            carrinho.limparCarrinho();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Forneça suas informações e conclua a compra ;)",)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: Text("Finalizar Compra", style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
