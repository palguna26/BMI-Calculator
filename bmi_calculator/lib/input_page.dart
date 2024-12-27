import 'package:bmi_calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/icon_text.dart';
import 'package:bmi_calculator/result_page.dart';

const bottomContainerHeight = 80.0;
const cardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
enum GenderType {
  male,
  female,
}
const boldStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);
const normalStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);
const titleStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

class InputPage extends StatefulWidget{
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType gender = GenderType.male;
  int height=120;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReUsableCard(onPress: (){
                  setState(() {
                    gender = GenderType.male;
                  });
                },colour: (gender == GenderType.male)?(cardColor):inactiveCardColor, cardChild: IconText(
                  title: "MALE",
                  icon: Icons.male,
                ),),
                ReUsableCard(onPress: (){
                  setState(() {
                    gender = GenderType.female;
                  });
                },colour: (gender == GenderType.female)?(cardColor):inactiveCardColor, cardChild: IconText(
                  title: "FEMALE",
                  icon: Icons.female,
                  ),
                ),
              ],
            ),
          ),
          ReUsableCard(colour: cardColor,cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text("HEIGHT",
                  style: normalStyle,
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text(height.toString(),
                    style: boldStyle,
                  ),
                  const Text("cm",
                    style: normalStyle,
                  )
                ],
              ),
              Slider(value: height.toDouble(),
                  min: 120,
                  max: 220,
                  activeColor: const Color(0xFFBE1555),
                  inactiveColor: const Color(0xFF8D8E98),
                  onChanged: (double newValue){
                setState(() {
                  height = newValue.toInt();
                });
              })
            ],
          ),onPress: (){},),
          Expanded(
            child: Row(
              children: [
                ReUsableCard(colour: cardColor,cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("WEIGHT",
                      style: normalStyle,
                    ),
                    const SizedBox(height: 3,),
                    Text(weight.toString(),
                      style: boldStyle,
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleButton(icon: FontAwesomeIcons.plus,func: (){
                          setState(() {
                            weight++;
                          });
                        }),
                        const SizedBox(width: 10.0,),
                        CircleButton(icon: FontAwesomeIcons.minus,func: (){
                          setState(() {
                            weight--;
                          });
                        },),
                      ],
                    )
                  ],
                ),onPress: (){},),
                ReUsableCard(colour: cardColor,cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("AGE",
                      style: normalStyle,
                    ),
                    const SizedBox(height: 3,),
                    Text(age.toString(),
                      style: boldStyle,
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleButton(icon: FontAwesomeIcons.plus,func: (){
                          setState(() {
                            age++;
                          });
                        }),
                        const SizedBox(width: 10.0,),
                        CircleButton(icon: FontAwesomeIcons.minus,func: (){
                          setState(() {
                            age--;
                          });
                        },),
                      ],
                    )
                  ],
                ),onPress: (){},),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(bmiResult: calc.calculateBMI(),resultText: calc.getResult(),interpretation: calc.getInterpretation(),)));
            },
            child: Container(
              width: double.infinity,
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10),
              height: bottomContainerHeight,
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 25,
                  )
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({super.key, required this.icon,required this.func});
  final IconData icon;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: func,
      child: Icon(icon),
    );
  }
}


