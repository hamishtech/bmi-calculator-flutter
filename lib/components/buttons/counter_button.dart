import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CounterButton extends StatelessWidget {
  final IconData icon;
  final Function cb;
  CounterButton({this.icon, this.cb});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: cb,
      child: Icon(icon, color: Colors.white),
      style: ElevatedButton.styleFrom(
          elevation: 50,
          shape: CircleBorder(),
          padding: EdgeInsets.all(10),
          primary: Color(0xFF5E6170), // <-- Button color
          onPrimary: Colors.greenAccent // <-- Splash color
          ),
    );
  }
}
