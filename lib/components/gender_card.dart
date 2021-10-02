import 'package:flutter/material.dart';

class GenderCardData extends StatelessWidget {
  final IconData icon;
  final String title;

  GenderCardData({@required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
