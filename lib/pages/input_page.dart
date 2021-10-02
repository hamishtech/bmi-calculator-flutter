import 'package:bmi_calculator/components/buttons/counter_button.dart';
import 'package:bmi_calculator/components/counter_card.dart';
import 'package:bmi_calculator/components/custom_card.dart';
import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/services/bmi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var bmi = BMI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      bmi.gender = "male";
                      setState(() {
                        bmi.gender = "male";
                      });
                    },
                    child: CustomCard(
                      color: bmi.gender == "male"
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: GenderCardData(
                          title: "MALE", icon: FontAwesomeIcons.mars),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        bmi.gender = "female";
                      });
                    },
                    child: CustomCard(
                      color: bmi.gender == "female"
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: GenderCardData(
                          title: "FEMALE", icon: FontAwesomeIcons.ghost),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(bmi.height.toStringAsFixed(0),
                          style: Theme.of(context).textTheme.bodyText2),
                      Text(
                        "cm",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Slider(
                      activeColor: bottomContainerColor,
                      min: 100,
                      max: 250,
                      value: bmi.height,
                      onChanged: (value) {
                        setState(() {
                          bmi.height = value.roundToDouble();
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: CounterCardChild(
                      title: "WEIGHT",
                      counterWidget: Column(
                        children: [
                          Text(
                            bmi.weight.toStringAsFixed(0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CounterButton(
                                  icon: FontAwesomeIcons.plus,
                                  cb: () {
                                    setState(() {
                                      bmi.weight += 1;
                                    });
                                  }),
                              CounterButton(
                                  icon: FontAwesomeIcons.minus,
                                  cb: () {
                                    setState(() {
                                      bmi.weight -= 1;
                                      ;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: CounterCardChild(
                      title: "AGE",
                      counterWidget: Column(
                        children: [
                          Text(
                            bmi.age.toStringAsFixed(0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CounterButton(
                                  icon: FontAwesomeIcons.plus,
                                  cb: () {
                                    setState(() {
                                      bmi.age += 1;
                                    });
                                  }),
                              CounterButton(
                                  icon: FontAwesomeIcons.minus,
                                  cb: () {
                                    setState(() {
                                      bmi.age -= 1;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              bmi.checkReady();
              if (bmi.ready) {
                bmi.calculateBMI();
                Navigator.pushNamed(context, '/results', arguments: bmi);
              }
            },
            child: Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Calculate BMI",
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
