import 'package:flutter/material.dart';
import 'package:flutter_one_rep_max_calculator/globals.dart' as globals;

class AppSettings extends StatefulWidget {
  final bool kg_uom;
  const AppSettings({super.key, required this.kg_uom});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00c853),
        title: const Text('Settings'),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SwitchListTile(
              title: const Text('Use Kilograms as Unit of Measure'),
              onChanged: (bool value) {
                setState(() {
                  globals.kg_unit_of_measure = value;
                });
              },
              value: globals.kg_unit_of_measure,

            )
          ],
        ),
      ),
    );
  }
}