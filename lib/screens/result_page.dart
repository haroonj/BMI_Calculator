import 'package:flutter/material.dart';
import '../components/RCard.dart';




class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,@required this.bmiString,@required this.bmiDes});

  final String bmiResult;
  final String bmiString;
  final String bmiDes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'YOUR RESULT',
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: RCard(
              color: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    bmiString,
                    style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult,
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiDes,
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,

                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              height: 60.0,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
