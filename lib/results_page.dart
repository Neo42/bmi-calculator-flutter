import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.advice,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI指数计算器           ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
              left: 20.0,
            ),
            child: Text(
              '你的结果',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
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
                    cardColor: kActiveCardColor,
                    cardChild: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            resultText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              letterSpacing: 20,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Text(
                            bmiResult,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '正常BMI范围:\n18.5 - 25 kg/m2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                              letterSpacing: 3,
                            ),
                          ),
                          Text(
                            advice,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              letterSpacing: 2.5,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          SaveButton(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputPage(),
                ),
              );
            },
            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 12.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                child: Text('重新计算BMI指数', style: kButtonTextStyle),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  SaveButton({this.buttonIcon, this.buttonAction});
  final IconData buttonIcon;
  final Function buttonAction;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(
        '保存结果',
        style: TextStyle(
          letterSpacing: 2,
          fontSize: 20,
        ),
      ),
      elevation: 6.0,
      fillColor: Color(0xFF777777),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onPressed: null,
      constraints: BoxConstraints.tightFor(
        width: 140.0,
        height: 60.0,
      ),
    );
  }
}
