import 'package:flutter/material.dart';


class Cafe extends StatefulWidget {
  const Cafe({super.key});

  @override
  State<Cafe> createState() => _CafeState();
}

class _CafeState extends State<Cafe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Icon(Icons.coffee),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.person_2_outlined),
            selectedIcon: Icon(Icons.person_2),
          ),
        ],
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text("SIMMMMMMMMM"),
            Container(
                  color: Colors.brown,
                  child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Image.network("https://www.supremoarabica.com.br/wp-content/uploads/2019/04/10-curisoidades-sobre-o-caf%C3%A9.jpg",),
                ),
                
            ),
            Text("Descrição:"),
          ],
      ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: const Color.fromARGB(255, 253, 199, 118),
        ),

        child: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "home",
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_bag_outlined),
              selectedIcon: Icon(Icons.shopping_bag),
              label: "Compra",
            ),
            NavigationDestination(
              icon: Icon(Icons.contact_support_outlined),
              selectedIcon: Icon(Icons.contact_support),
              label: "Suporte",
            ),
          ],
        ),
      ),
    );
  }
}