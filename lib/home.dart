import 'package:flutter/material.dart';
import 'package:projeto_ana/cafe.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  text: "Encontre \nsua dose de ",
                  style: TextStyle(
                    fontSize: 55,
                  ),
                  children: [
                    TextSpan(
                      text: "energia ",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationThickness: 0.5,
                      ),
                    ),
                    TextSpan(
                      text: "aqui!\n",
                    ),
                    TextSpan(
                      text: "-Cofcof",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ),
             SizedBox(height: 20,),

              Row(
                children: [
                  ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cafe()),
                  );
                },
                child: Text("Cappucino"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cafe()),
                  );
                },
                child: Text("Cappucino"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cafe()),
                  );
                },
                child: Text("Cappucino"),
              ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 180, 131, 112),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
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
