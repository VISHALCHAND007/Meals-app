import 'package:flutter/material.dart';

class MealTags extends StatelessWidget {
  final String outputText;
  final IconData icon;

  const MealTags({super.key, required this.outputText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(icon), SizedBox(width: 4), Text(outputText)]);
  }
}
