import 'package:flutter/material.dart';

class GenderCardContent extends StatelessWidget {
  GenderCardContent({this.genderIcon, this.gender, this.labelTextStyle});

  final IconData genderIcon;
  final String gender;
  final TextStyle labelTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 60,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: labelTextStyle,
        )
      ],
    );
  }
}
