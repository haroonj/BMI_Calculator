import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/GCard.dart';
import '../components/RCard.dart';
import '../components/RoundB.dart';
import 'result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

const color = Color(0xFF1D1E33);
const incolor = Color(0xFF111328);
enum Gender { male, female }
int height = 186;
int weight = 70;
int age = 21;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RCard(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male ? color : incolor,
                      cardChild: GCard(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: RCard(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female ? color : incolor,
                      cardChild: GCard(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: RCard(
                color: color,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFF8D8E98)),
                        )
                      ],
                    ),
                    Expanded(
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        min: 100,
                        max: 210,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RCard(
                      color: color,
                      cardChild: Column(
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xFF8D8E98)),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 45.0, fontWeight: FontWeight.w900),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundB(
                                  icon: FontAwesomeIcons.minus,
                                  press: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundB(
                                  icon: FontAwesomeIcons.plus,
                                  press: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RCard(
                      color: color,
                      cardChild: Column(
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xFF8D8E98)),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 45.0, fontWeight: FontWeight.w900),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundB(
                                  icon: FontAwesomeIcons.minus,
                                  press: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundB(
                                  icon: FontAwesomeIcons.plus,
                                  press: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
               CalculatorBrain calc = CalculatorBrain(
                  height: height,
                  weight: weight
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiResult: calc.calculateBMI(),
                    bmiString: calc.getResult(),
                    bmiDes: calc.getDes(),
                  );
                }));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                height: 60.0,
                width: double.infinity,
              ),
            )
          ],
        ));
  }
}
