import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_tags.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  Function(String) removeItem;

  MealItem({required this.meal, required this.removeItem, super.key});

  void _onMealSelected(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamed(MealDetailsScreen.routeName, arguments: meal.id).then((result) {
      if (result != null) removeItem(result as String);
    });
  }

  String get getMealComplexity {
    switch (meal.complexity) {
      case Complexity.simple:
        return "Simple";
      case Complexity.challenging:
        return "Challenging";
      case Complexity.hard:
        return "Hard";
    }
  }

  String get getMealAffordability {
    switch (meal.affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.pricey:
        return "Pricey";
      case Affordability.luxurious:
        return "Luxurious";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onMealSelected(context),
      // splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  MealTags(
                    outputText: "${meal.duration} min",
                    icon: Icons.schedule,
                  ),
                  MealTags(outputText: getMealComplexity, icon: Icons.work),
                  MealTags(
                    outputText: getMealAffordability,
                    icon: Icons.attach_money,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
