import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import '../models/category.dart';

class CategoryItems extends StatelessWidget {
  final Category category;

  const CategoryItems({required this.category, super.key});

  void categorySelected(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(category: category);
    //     },
    //   ),
    // );
    Navigator.of(
      context,
    ).pushNamed(CategoryMealsScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => categorySelected(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
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
      ),
    );
  }
}
