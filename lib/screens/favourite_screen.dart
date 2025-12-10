import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  const FavouriteScreen({super.key, required this.favouriteMeals});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Navigator.of(context).pushNamed("/");
      },
      child: favouriteMeals.isEmpty
          ? Center(
              child: Text(
                "No favourite's added yet!",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, ind) {
                return MealItem(meal: favouriteMeals[ind]);
              },
              itemCount: favouriteMeals.length,
            ),
    );
  }
}
