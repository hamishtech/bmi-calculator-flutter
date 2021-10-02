import 'package:flutter/material.dart';

class CounterCardChild extends StatelessWidget {
  final String title;
  final Widget counterWidget;

  CounterCardChild({this.title, this.counterWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyText1),
        SizedBox(
          height: 10,
        ),
        counterWidget,
      ],
    );
  }
}
