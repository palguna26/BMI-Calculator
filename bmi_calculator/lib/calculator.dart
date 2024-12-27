import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height,required this.weight});

  final int height;
  final int weight;
  final double _bmi=0;
  String calculateBMI() {
    double bmi = weight / pow(height /100,2);
    return bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25) {
      return "OVERWEIGHT";
    }
    else if (_bmi> 18.5) {
      return "NORMAL";
    }
    else {
      return "UNDERWEIGHT";
    }
  }

  String getInterpretation(){
    if(_bmi >= 25) {
      return "You have a higher than normal body weight.Try to exercise more";
    }
    else if (_bmi> 18.5) {
      return "Great Job! You have a normal body weight.";
    }
    else {
      return "You have a lower than normal body weight.Try to eat more!";
    }
  }
}