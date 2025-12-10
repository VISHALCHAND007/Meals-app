import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildDrawerTile(
    IconData icon,
    String title,
    VoidCallback onTapHandler,
  ) {
    return ListTile(
      leading: Icon(icon, size: 24),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Stack(
                children: [
                  Image.asset("assets/images/bg.jpg", fit: BoxFit.fitWidth),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      "Meals App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildDrawerTile(
              Icons.home,
              "Home",
              () => Navigator.of(context).pushReplacementNamed("/"),
            ),
            buildDrawerTile(
              Icons.settings,
              "Filters",
              () => Navigator.of(context).pushReplacementNamed(FilterScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
