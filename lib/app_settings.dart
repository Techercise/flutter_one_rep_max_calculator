
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
      globals.epley_formula_on = prefs.getBool('globals.epley_formula_on') ?? true;
      globals.brzycki_formula_on = prefs.getBool('globals.brzycki_formula_on') ?? true;
      globals.landers_formula_on = prefs.getBool('globals.landers_formula_on') ?? true;
      globals.lombardi_formula_on = prefs.getBool('globals.lombardi_formula_on') ?? true;
      globals.mayhew_formula_on = prefs.getBool('globals.mayhew_formula_on') ?? true;
      globals.oconner_formula_on = prefs.getBool('globals.oconner_formula_on') ?? true;
      globals.wathen_formula_on = prefs.getBool('globals.wathen_formula_on') ?? true;
    });
  }

  Future<void> _updatePreferences(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
    setState(() {
      if (key == 'globals.kg_unit_of_measure') {
        globals.kg_unit_of_measure = value;
      }
      else if (key == 'globals.epley_formula_on') {
        globals.epley_formula_on = value;
      }
      else if(key == 'globals.brzycki_formula_on') {
        globals.brzycki_formula_on = value;
      }
      else if(key == 'globals.landers_formula_on') {
        globals.landers_formula_on = value;
      }
      else if(key == 'globals.lombardi_formula_on') {
        globals.lombardi_formula_on = value;
      }
      else if(key == 'globals.mayhew_formula_on') {
        globals.mayhew_formula_on = value;
      }
      else if(key == 'globals.oconner_formula_on') {
        globals.oconner_formula_on = value;
      }
      else if(key == 'globals.wathen_formula_on') {
        globals.wathen_formula_on = value;
      }
    });
  }

  bool isOneFormulaTrue() {
    bool one_formula_true = false;
    if(globals.epley_formula_on || globals.brzycki_formula_on || globals.landers_formula_on || globals.lombardi_formula_on || globals.mayhew_formula_on || globals.oconner_formula_on || globals.wathen_formula_on)
      {
        one_formula_true = true;
      }
    return one_formula_true;
  }

  void ensureOneFormulaIsChecked() {
    bool at_least_one_formula_on = isOneFormulaTrue();
    if (!at_least_one_formula_on)
      {
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: const Text('At least one formula must be checked to calculate a one rep max!'),
          action: SnackBarAction(
            textColor: Colors.white,
            label: 'OK',
            onPressed: scaffold.hideCurrentSnackBar,
          ),
        ));
      }
    else
      {
        Navigator.pop(context, true);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: ensureOneFormulaIsChecked,
            icon: Icon(Icons.arrow_back)),
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
              onChanged: (value) {
                setState(() {
                  _updatePreferences('globals.epley_formula_on', value!);
                });
              },
            value: globals.epley_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('Brzycki Formula'),
            onChanged: (bool? value) {
              setState(() {
                _updatePreferences('globals.brzycki_formula_on', value!);
              });
            },
            value: globals.brzycki_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('Landers Formula'),
            onChanged: (bool? value) {
              setState(() {
                _updatePreferences('globals.landers_formula_on', value!);
              });
            },
            value: globals.landers_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('Lombardi Formula'),
            onChanged: (bool? value) {
              setState(() {
                _updatePreferences('globals.lombardi_formula_on', value!);
              });
            },
            value: globals.lombardi_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('Mayhew Formula'),
            onChanged: (bool? value) {
              setState(() {
                _updatePreferences('globals.mayhew_formula_on', value!);
              });
            },
            value: globals.mayhew_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('O\'Conner Formula'),
            onChanged: (bool? value) {
              setState(() {
                _updatePreferences('globals.oconner_formula_on', value!);
              });
            },
            value: globals.oconner_formula_on,
            activeColor: const Color(0xff00c853),
          ),
          CheckboxListTile(
            title: const Text('Wathen Formula'),
            onChanged: (bool? value) {
              setState(() {
                _updatePreferences('globals.wathen_formula_on', value!);
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