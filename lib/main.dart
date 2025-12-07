import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/category_screen.dart';

void main() => runApp(_MyMealsApp());

class _MyMealsApp extends StatefulWidget {
  @override
  State createState() => _MyMealsAppState();
}

class _MyMealsAppState extends State<_MyMealsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: const Color.fromRGBO(255, 254, 225, 1),
        fontFamily: "Raleway",
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleLarge: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          ),
          // titleSmall:
        ),
      ),
      // home: const CategoryScreen(),
      routes: {
        "/": (ctx) => CategoryScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
      },
    );
  }
}
