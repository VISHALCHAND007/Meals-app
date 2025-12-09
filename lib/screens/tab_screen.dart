import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/favourite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meals App"),
          leading: const Icon(Icons.menu),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(icon: Icon(Icons.category), text: "Categories"),
              Tab(icon: Icon(Icons.star), text: "Favourite"),
            ],
          ),
        ),
        body: TabBarView(children: [CategoryScreen(), FavouriteScreen()]),
      ),
    );
  }
}
