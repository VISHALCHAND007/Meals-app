import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_items.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals App"),
        leading: const Icon(Icons.menu),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
        ),
        children: [
          ...DUMMY_CATEGORIES.map(
            (category) => CategoryItems(category: category),
          ),
        ],
      ),
    );
  }
}
