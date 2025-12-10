import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../models/category.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";
  final List<Meal> availableMeals;

  // final Category category;
  // const CategoryMealsScreen({required this.category, super.key});

  const CategoryMealsScreen({super.key, required this.availableMeals});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var isInitDone = false;
  late String title;
  late List<Meal> categoryMeals;

  void removeItem(String mealId) {
    categoryMeals.removeWhere((meal) => meal.id == mealId);
  }

  @override
  void didChangeDependencies() {
    if (!isInitDone) {
      isInitDone = true;
      final routeArgs = ModalRoute.of(context)?.settings.arguments as Category;
      title = routeArgs.title;
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(routeArgs.id);
      }).toList();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: categoryMeals.isEmpty
          ? Center(child: Image.asset("assets/images/not_found.png", height: 150, fit: BoxFit.cover,))
          : ListView.builder(
              itemBuilder: (context, ind) {
                return MealItem(meal: categoryMeals[ind]);
              },
              itemCount: categoryMeals.length,
            ),
    );
  }
}
