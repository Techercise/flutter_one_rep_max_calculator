import 'package:flutter/material.dart';
import 'dart:math';
import 'package:collection/collection.dart';

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
        child: ListView(
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
                child:
                  Text(
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
                            fontFamily: 'sans-serif-smallcaps', fontSize: 24),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextField(
                          obscureText: false,
                          decoration:
                              const InputDecoration(border: UnderlineInputBorder()),
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
                      width: 50,
                      child: TextField(
                        obscureText: false,
                        decoration:
                            const InputDecoration(border: UnderlineInputBorder()),
                        keyboardType: TextInputType.number,
                        controller: repsFieldText,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
                child: SizedBox(
              width: safeWidth,
              height: 100,
            )),
            OverflowBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: _calculateProjectedOneRepMax,
                  style: TextButton.styleFrom(
                      foregroundColor: const Color(0xff00c853),
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  child: const Text('SUBMIT'),
                ),
                TextButton(
                    onPressed: _clearAllInputs,
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    child: const Text('CLEAR'))
              ],
            ),
          ],
        )
    );
  }

  void _calculateProjectedOneRepMax() {

    setState(() {
      _clicked = true;
    });

    weightLifted = int.parse(weightFieldText.text);
    repsPerformed = int.parse(repsFieldText.text);
    // Epley Formula
    final epleyORM = (weightLifted * (1 + repsPerformed / 30));

    // Brzycki Formula
    final brzyckiORM = weightLifted * (36 / (37 - repsPerformed));

    // McGlothlin Formula
    final mcGlothlinORM =
        (100 * weightLifted) / (101.3 - (2.67123 - repsPerformed));

    // Lombardi Formula
    final lombardiORM = weightLifted * pow(repsPerformed, 0.1);

    // Mayhew Formula
    final mayhewORM = (100 * weightLifted) /
        (52.2 + (41.9 * pow(e, (-0.055 * repsPerformed))));

    // O'Conner Formula
    final oconnerORM = weightLifted * (1 + (repsPerformed / 40));

    // Wathan Formula
    final wathanORM = (100 * weightLifted) /
        (48.8 + (pow((53.8 * e), (-0.075 * repsPerformed))));

    final avgORM = [epleyORM, brzyckiORM, mcGlothlinORM, lombardiORM,
        mayhewORM, oconnerORM, wathanORM].average;

    projectedORM = avgORM.round().toString();
  }

  void _clearAllInputs()
  {
    setState(() {
      _clicked = false;
    });
    repsPerformed = 0;
    weightLifted = 0;
    projectedORM = '';
    weightFieldText.clear();
    repsFieldText.clear();
  }
}
