import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.bmiResult,required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("BMI CALCULATOR"
            ),
          ),),
        body: Column(
          children: [
            Expanded(child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: titleStyle,
              ),
            ),),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF1D1E33),
                ),
                margin: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF24D876),
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(bmiResult,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                    ),),
                    Center(
                      child: Text(interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BMICalculator()));
              },
              child: Container(
                width: double.infinity,
                color: const Color(0xFFEB1555),
                margin: const EdgeInsets.only(top: 10),
                height: bottomContainerHeight,
                child: Center(
                  child: Text(
                        "RE-CALCULATE",
                      style: TextStyle(
                        fontSize: 25,
                      )
                  ),
                ),
              ),
            ),)

          ],
        )


      ),
    );
  }
}
