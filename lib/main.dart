import 'package:flutter/material.dart';
import 'package:flutter_one_rep_max_calculator/calculator.dart' as calc;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_one_rep_max_calculator/app_settings.dart' as settings;

void main() {
  runApp(const OneRepMaxCalculator());
}

class OneRepMaxCalculator extends StatelessWidget {
  const OneRepMaxCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InitScreen());
  }
}

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00c853),
        title: const Text('One Rep Max Calculator'),
      ),
      body: const calc.Calculator(),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children:  [
              const SizedBox(
                height: 100.0,
                child: DrawerHeader(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                  margin: EdgeInsets.zero,
                  child: Text('Help', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                ),
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const settings.AppSettings()));
                },
                leading: const Icon(Icons.settings),
              ),
              const ListTile(
                title: Text('View Privacy Policy'),
                onTap: _launchURL,
                leading: Icon(Icons.open_in_browser_rounded),
              )
            ],
          )
      ),
    );
  }
}

_launchURL() async {
  final Uri privacyPolicy = Uri.parse('https://sites.google.com/site/techerciseapps/orm-privacy-policy');
  if (!await launchUrl(privacyPolicy)) {
    throw Exception('Could not launch $privacyPolicy');
  }
}
