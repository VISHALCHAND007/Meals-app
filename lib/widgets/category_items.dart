import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItems extends StatelessWidget {
  final Category category;

  const CategoryItems({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [category.color, category.color.withAlpha(160)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
