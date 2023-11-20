// Copyright 2023 eduhoratiu <https://eduhoratiu.com/>
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../common/strings.dart' as strings;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<String> _widgetOptions = <String>[

    'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg',

    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Espaguetis_carbonara.jpg/1200px-Espaguetis_carbonara.jpg',

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.homeScreenTitle),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 33),
              ),
              child: Center(child: Text('Meniu', style: optionStyle )),
            ),
            ListTile(
              title: const Text('Pizza'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Paste'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Image(
          image: NetworkImage(_widgetOptions[_selectedIndex]),
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 22, 130, 188),
        icon: const Icon(Icons.shopping_cart),
        label: const Text(strings.homeFABLabel),
        splashColor: const Color.fromARGB(255, 4, 0, 255),
      
        onPressed: () {
          showShoppingCart(context);
        }
      ),
    );
  }

  void showShoppingCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text(strings.shoppingCartTitle),
          content: Text(strings.shoppingCartProducts),
        );
      },
    );
  }

}