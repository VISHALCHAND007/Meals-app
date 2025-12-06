import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(_MyMealsApp());

class _MyMealsApp extends StatefulWidget {
  @override
  State createState() => _MyMealsAppState();
}

class _MyMealsAppState extends State<_MyMealsApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Meals App", home: HomePageScreen());
  }
}

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meals App"), leading: Icon(Icons.menu)),
      body: Center(child: Text("Meals App body")),
    );
  }
}
