import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'gender_card_content.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 23;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI指数计算器',
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
                      gender: "男性",
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
                      gender: "女性",
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
                          '身高',
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
                              '厘米',
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
                          "体重",
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SmallIconButton(
                              smallIcon: FontAwesomeIcons.minus,
                              buttonAction: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            SmallIconButton(
                              smallIcon: FontAwesomeIcons.plus,
                              buttonAction: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "年龄",
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SmallIconButton(
                              smallIcon: FontAwesomeIcons.minus,
                              buttonAction: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            SmallIconButton(
                              smallIcon: FontAwesomeIcons.plus,
                              buttonAction: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                            ),
                          ],
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
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
            child: Center(
              child: Text(
                '点我出结果！',
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

class SmallIconButton extends StatelessWidget {
  SmallIconButton({this.smallIcon, this.buttonAction});
  final IconData smallIcon;
  final Function buttonAction;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(smallIcon),
      elevation: 6.0,
      fillColor: Color(0xFF1C2033),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      onPressed: buttonAction,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
