import 'package:flutter/material.dart';

void main() => runApp(MeuMaterialApp());

class MeuMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplicação Teste'),
        ), // AppBar
        drawer: const Drawer(),
        body: const Center(
          child: Text('Principal'),
        ), // Center
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Principal',
            ), // BottomNavigationBarItem
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Configurações',
            ) // BottomNavigationBarItem
          ], // <BottomNavigationBarItem>[]
        ), // BottomNavigationBar
      ), // Scaffold
    ); // MaterialApp
  }
}