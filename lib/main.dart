import 'package:flutter/material.dart';

import './screens/meal_details_screen.dart';
import './screens/tab_screen.dart';
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
            fontWeight: FontWeight.bold,
          ),
          // titleSmall:
        ),
      ),
      // home: const CategoryScreen(),
      routes: {
        "/": (ctx) => TabScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
      },
      onGenerateRoute: (settings) {
        //called if a route is not registered in routes
        return MaterialPageRoute(
          builder: (ctx) {
            return CategoryScreen();
          },
        );
      },
      onUnknownRoute: (settings) {
        // called in scenario if the routes and on Generate is not registered or flutter is not able
        // to create the page we want

        return MaterialPageRoute(
          builder: (ctx) {
            return CategoryScreen();
          },
        );
      },
    );
  }
}
