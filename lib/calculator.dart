import 'package:flutter/material.dart';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter_one_rep_max_calculator/globals.dart' as globals;

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool _clicked = false;

  int weightLifted = 0;
  int repsPerformed = 0;
  String projectedORM = '';

  final weightFieldText = TextEditingController();
  final repsFieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    EdgeInsets padding = MediaQuery.of(context).padding;
    double safeHeight = height - padding.top - padding.bottom;
    double safeWidth = width - padding.left - padding.right;

    return Container(
        color: Colors.white,
        height: safeHeight,
        width: safeWidth,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                      color: Colors.white,
                      alignment: AlignmentDirectional.topCenter,
                      child: const Text(
                        'Projected\n One Rep Max',
                        style: TextStyle(
                            fontSize: 48.0,
                            color: Color(0xffEEFF41),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'sans-serif-smallcaps'),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    height: 1,
                    width: safeWidth,
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    color: const Color(0xff5A5A5A),
                  ),
                  Container(
                    margin: const EdgeInsets.all(24.0),
                    height: safeHeight / 5,
                    alignment: AlignmentDirectional.center,
                    child: Visibility(
                      visible: _clicked,
                      child: Text(
                        projectedORM,
                        style: const TextStyle(
                            fontSize: 48.0,
                            color: Color(0xff00c853),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Weight\nLifted',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'sans-serif-smallcaps',
                                  fontSize: 24),
                            ),
                            SizedBox(
                              width: 40,
                              child: TextField(
                                obscureText: false,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff5A5A5A))),
                                ),
                                keyboardType: TextInputType.number,
                                controller: weightFieldText,
                              ),
                            ),
                          ]),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Reps\nAchieved',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'sans-serif-smallcaps',
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: TextField(
                              obscureText: false,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff5A5A5A)))),
                              keyboardType: TextInputType.number,
                              controller: repsFieldText,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,
              overflowAlignment: OverflowBarAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: safeWidth / 2,
                  child: TextButton(
                    onPressed: calculateProjectedOneRepMax,
                    style: TextButton.styleFrom(
                        foregroundColor: const Color(0xff00c853),
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    child: const Text('SUBMIT'),
                  ),
                ),
                SizedBox(
                  width: safeWidth / 2,
                  child: TextButton(
                      onPressed: clearAllInputs,
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          padding: const EdgeInsets.all(16.0),
                          textStyle: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                      child: const Text('CLEAR')),
                )
              ],
            ),
          ],
        ));
  }

  void calculateProjectedOneRepMax() {
    setState(() {
      _clicked = true;
    });

    if ((weightFieldText.text == '') && (repsFieldText.text == '')) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content:
            const Text('Enter reps and weight to get a projected one rep max'),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'OK',
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ));
      _clicked = false;
    }
    else if (weightFieldText.text == '' && (repsFieldText.text != '')) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: const Text('Enter weight to get a projected one rep max'),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'OK',
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ));
      _clicked = false;
    }
    else if (weightFieldText.text != '' && (repsFieldText.text == '')) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: const Text('Enter reps to get a projected one rep max'),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'OK',
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ));
      _clicked = false;
    }
    else {
      averageORMCalculation();
    }
  }

  void clearAllInputs() {
    setState(() {
      _clicked = false;
    });

    repsPerformed = 0;
    weightLifted = 0;
    projectedORM = '';
    weightFieldText.clear();
    repsFieldText.clear();
  }

  String averageORMCalculation() {
    projectedORM = '';
    weightLifted = int.parse(weightFieldText.text);
    repsPerformed = int.parse(repsFieldText.text);

    double avgORM = 0.0;

    // Clear previous values from the list so we're always calculating a ORM for
    // the current input and not including prior inputs.
    globals.ORMFormulasUsed.clear();

    if (globals.epley_formula_on) {
      // Epley Formula
      double epleyORM = weightLifted * (1 + (repsPerformed / 30));
      globals.ORMFormulasUsed.add(epleyORM);
    }

    if (globals.brzycki_formula_on) {
      // Brzycki Formula
      double brzyckiORM = weightLifted * (36 / (37 - repsPerformed));
      globals.ORMFormulasUsed.add(brzyckiORM);
    }

    if (globals.landers_formula_on) {
      // Landers Formula
      double landersORM = weightLifted / (1.013 - (0.0267123 * repsPerformed));
      globals.ORMFormulasUsed.add(landersORM);
    }

    if (globals.lombardi_formula_on) {
      // Lombardi Formula
      num lombardiORM = weightLifted * pow(repsPerformed, 0.1);
      globals.ORMFormulasUsed.add(lombardiORM);
    }

    if (globals.mayhew_formula_on) {
      // Mayhew Formula
      double mayhewORM =
          weightLifted / (0.522 + (0.419 * pow(e, (-0.055 * repsPerformed))));
      globals.ORMFormulasUsed.add(mayhewORM);
    }

    if (globals.oconner_formula_on) {
      // O'Conner Formula
      double oconnerORM = weightLifted * (1 + (0.025 * repsPerformed));
      globals.ORMFormulasUsed.add(oconnerORM);
    }

    if (globals.wathen_formula_on) {
      // Wathen Formula
      double wathenORM = weightLifted /
          (0.4880 + (0.538 * (pow(e, (-0.075 * repsPerformed)))));
      globals.ORMFormulasUsed.add(wathenORM);
    }

    for (int i = 0; i < globals.ORMFormulasUsed.length; i++) {
      avgORM += globals.ORMFormulasUsed[i];
    }

    avgORM /= globals.ORMFormulasUsed.length;

    if (globals.kg_unit_of_measure == true) {
      projectedORM = '${avgORM.round()} kgs.';
    }
    else {
      projectedORM = '${avgORM.round()} lbs.';
      avgORM = 0.0;
    }
    return projectedORM;
  }
}
