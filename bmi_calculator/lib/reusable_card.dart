import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  const ReUsableCard({super.key, required this.colour,required this.cardChild,required this.onPress});

  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colour,
          ),
          margin: const EdgeInsets.all(15.0),
          child: cardChild,
        ),
      ),
    );
  }
}