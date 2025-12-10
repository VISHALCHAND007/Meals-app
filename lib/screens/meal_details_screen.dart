import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  const MealDetailsScreen({super.key});

  Widget createTitleWidget(String title, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget cardContainer(Widget child) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final mealObj = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(title: Text(mealObj.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(mealObj.imageUrl, fit: BoxFit.cover),
            ),
            createTitleWidget("Ingredients", context),

            cardContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("> ${mealObj.ingredients[index]}"),
                  ),
                ),
                itemCount: mealObj.ingredients.length,
              ),
            ),

            createTitleWidget("Steps", context),

            cardContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primaryContainer,
                          child: Text("${index + 1}."),
                        ),
                        title: Text(mealObj.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: mealObj.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
