

import 'package:flutter/material.dart';
import 'package:flutter_one_rep_max_calculator/calculator.dart' as calc;
import 'package:url_launcher/url_launcher.dart';

void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00c853),
        title: const Text('One Rep Max Calculator'),
        // leading: const IconButton(
        //   icon: Icon(Icons.menu),
        //   tooltip: 'Menu Button',
        //   onPressed: () {},
        // ),
      ),
      body: const calc.Calculator(),
      bottomNavigationBar: const BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          overflowAlignment: OverflowBarAlignment.center,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            SizedBox(
              height: 40.0,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: Text('Settings Menu'),
              ),
            ),
            ListTile(
              title: Text('View Privacy Policy'),
              onTap: _launchURL,
            )
          ],
        )
      ),
    ),
  ));
}

// void menuButtonPressed()
// {
//   Widget build(BuildContext context)
//   {
//     return
//   }
// }

_launchURL() async {
  final Uri privacyPolicy = Uri.parse('https://sites.google.com/site/techerciseapps/orm-privacy-policy');
  if (!await launchUrl(privacyPolicy)) {
    throw Exception('Could not launch $privacyPolicy');
  }
}