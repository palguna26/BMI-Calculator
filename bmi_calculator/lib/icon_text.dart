import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({super.key, required this.title,required this.icon});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 80.0,
        ),
        const SizedBox(height: 20.0,),
        Text(title, style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98)
        ),),
      ],
    );
  }
}