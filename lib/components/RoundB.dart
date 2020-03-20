import 'package:flutter/material.dart';

class RoundB extends StatelessWidget {
  RoundB({this.icon,this.press});
  final IconData icon;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: press,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}
