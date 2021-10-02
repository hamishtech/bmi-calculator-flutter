import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;

  CustomCard({@required this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      width: double.infinity,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    );
  }
}
