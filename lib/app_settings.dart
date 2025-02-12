
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_one_rep_max_calculator/globals.dart' as globals;

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals.kg_unit_of_measure = prefs.getBool('globals.kg_unit_of_measure') ?? false;
    });
  }

  Future<void> _updatePreferences(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
    setState(() {
      globals.kg_unit_of_measure = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00c853),
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SwitchListTile(
            title: const Text('Use Kilograms as Unit of Measure'),
            onChanged: (value) {
              setState(() {
                _updatePreferences('globals.kg_unit_of_measure', value);
              });
            },
            value: globals.kg_unit_of_measure,
          ),
          const ListTile(
            title: Text('Formulas Used in Calculation',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          CheckboxListTile(
              title: const Text('Epley Formula'),
              onChanged: (bool? value) {
                setState(() {
                  globals.epley_formula_on = value!;
                });
              },
            value: globals.epley_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('Brzycki Formula'),
            onChanged: (bool? value) {
              setState(() {
                globals.brzycki_formula_on = value!;
              });
            },
            value: globals.brzycki_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('Landers Formula'),
            onChanged: (bool? value) {
              setState(() {
                globals.landers_formula_on = value!;
              });
            },
            value: globals.landers_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('Lombardi Formula'),
            onChanged: (bool? value) {
              setState(() {
                globals.lombardi_formula_on = value!;
              });
            },
            value: globals.lombardi_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('Mayhew Formula'),
            onChanged: (bool? value) {
              setState(() {
                globals.mayhew_formula_on = value!;
              });
            },
            value: globals.mayhew_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('O\'Conner Formula'),
            onChanged: (bool? value) {
              setState(() {
                globals.oconner_formula_on = value!;
              });
            },
            value: globals.oconner_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('Wathen Formula'),
            onChanged: (bool? value) {
              setState(() {
                globals.wathen_formula_on = value!;
              });
            },
            value: globals.wathen_formula_on,
            activeColor: const Color(0xff00c853),
          ),
        ],
      ),
    );
  }
}