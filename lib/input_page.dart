import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'gender_card_content.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCardContent(
                      genderIcon: kMaleIcon,
                      gender: "MALE",
                      labelTextStyle: kLabelStyle,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCardContent(
                      genderIcon: kFemaleIcon,
                      gender: "FEMALE",
                      labelTextStyle: kLabelStyle,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelStyle,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberStyle,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'cm',
                              style: kLabelStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            thumbColor: Color(0xFFEA1556),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0),
                            overlayColor: Color(0x29EA1556),
                            activeTrackColor: Colors.white,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            inactiveColor: Color(0xFF888888),
                            max: 220.0,
                            min: 120.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: Color(0xFF1C2033),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF1C2033),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kInactiveCardColor,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
            child: Center(
              child: Text(
                'CALCULATE YOUR MBI',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
