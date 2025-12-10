import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {

  static final routeName = "/filters";
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters"),),
      drawer: MainDrawer(),
      body: Center(child: Text("Filters"),),
    );
  }
}
