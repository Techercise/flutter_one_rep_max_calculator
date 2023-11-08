import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double width = size.width;
    double height = size.height;
    EdgeInsets padding = MediaQuery
        .of(context)
        .padding;
    double safeHeight = height - padding.top - padding.bottom;
    double safeWidth = width - padding.left - padding.right;

    return Container(
      color: Colors.white,
      child: Column(
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
              height: safeHeight/5,
              alignment: AlignmentDirectional.center,
              child: const Text(
                '122 lbs.',
                style: TextStyle(
                    fontSize: 48.0,
                    color: Color(0xff00c853),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Weight\nLifted',
                      textAlign: TextAlign.center,
                      style:
                        TextStyle(
                          fontFamily: 'sans-serif-smallcaps',
                          fontSize: 24
                        ),
                    ),
                    SizedBox(
                      width: 50,
                      child:
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder()
                        ),
                      ),
                    ),
                  ]
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Reps\nAchieved',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'sans-serif-smallcaps',
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child:
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder()
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child:
                SizedBox(
                  width: safeWidth,
                  height: 100,
                )
            ),
            OverflowBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xff00c853),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold)
                  ),
                  child: const Text('SUBMIT'),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold)
                  ),
                  child: const Text('CLEAR')
                )
              ],
            ),
          ],
        )
      );
    }
}
