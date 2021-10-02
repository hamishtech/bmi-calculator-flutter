import 'package:bmi_calculator/components/custom_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/services/bmi.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bmi = ModalRoute.of(context).settings.arguments as BMI;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'YOUR RESULT',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmi.results['result'].toUpperCase(),
                    style: TextStyle(color: bmi.results['color'], fontSize: 20),
                  ),
                  Text(
                    bmi.bmi.toStringAsFixed(1),
                    style: TextStyle(fontSize: 75),
                  ),
                  Text(
                    bmi.results['text'],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: bmi.results['color'], fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Re-calculate",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
