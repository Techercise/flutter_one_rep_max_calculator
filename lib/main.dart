import 'package:flutter/material.dart';
import 'package:flutter_one_rep_max_calculator/calculator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00c853),
        title: const Text('One Rep Max Calculator'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Button',
          onPressed: () {},
        ),
      ),
      body: const Calculator()
    ),
  ));
}
