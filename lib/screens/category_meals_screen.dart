import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  // final Category category;
  // const CategoryMealsScreen({required this.category, super.key});

  const CategoryMealsScreen({super.key});

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
   if(!isInitDone) {
     isInitDone = true;
     final routeArgs = ModalRoute.of(context)?.settings.arguments as Category;
     title = routeArgs.title;
     categoryMeals = DUMMY_MEALS.where((meal) {
       return meal.categories.contains(routeArgs.id);
     }).toList();

   }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemBuilder: (context, ind) {
          return MealItem(meal: categoryMeals[ind], removeItem: removeItem,);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
