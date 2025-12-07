import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  // final Category category;
  // const CategoryMealsScreen({required this.category, super.key});

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Category;
    final title = routeArgs.title;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(routeArgs.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemBuilder: (context, ind) {
          return MealItem(meal: categoryMeals[ind]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
