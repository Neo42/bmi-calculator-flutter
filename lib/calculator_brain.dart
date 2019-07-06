import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});
  final int height;
  final int weight;

  double _bmi;

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return '过胖';
    } else if (_bmi > 18.5) {
      return '正常';
    } else {
      return '过痩';
    }
  }

  String getAdvice() {
    if (_bmi >= 25) {
      return '你太胖了!\n快去锻炼!';
    } else if (_bmi > 18.5) {
      return '你的体重很正常!\n请继续保持吧!';
    } else {
      return '你太瘦了!\n多吃点!';
    }
  }
}
