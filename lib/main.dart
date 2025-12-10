import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/filter.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/filter_screen/filter_screen.dart';

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
  Filter filters = Filter(isGlutenFree: false, isLactoseFree: false, isVegetarian: false, isVegan: false);

  List<Meal> _availableMeals = DUMMY_MEALS;

  void setFilters(Filter newFilters) {
    setState(() {
      // print("${newFilters.isGlutenFree}, ${newFilters.isLactoseFree}, ${newFilters.isVegan}, ${newFilters.isVegetarian}");
      filters = newFilters;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if(filters.isGlutenFree && !meal.isGlutenFree) {
          return false;
        }
        if(filters.isLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if(filters.isVegan && !meal.isVegan) {
          return false;
        }
        if(filters.isVegetarian && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(availableMeals: _availableMeals,),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(setFilters: setFilters,filters: filters,),
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
