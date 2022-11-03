import 'package:app/pages/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckModeBanner:false,
      debugShowCheckedModeBanner: false,
      title: 'Portfólio',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const AnimacoesPage(),
    );
  }
}
