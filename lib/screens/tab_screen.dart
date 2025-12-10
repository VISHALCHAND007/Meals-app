import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../screens/category_screen.dart';
import '../screens/favourite_screen.dart';

// class TabScreen extends StatefulWidget {
//   const TabScreen({super.key});
//
//   @override
//   State<TabScreen> createState() => _TabScreenState();
// }
//
// class _TabScreenState extends State<TabScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       // initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Meals App"),
//           leading: const Icon(Icons.menu),
//           bottom: TabBar(
//             indicatorSize: TabBarIndicatorSize.tab,
//             tabs: [
//               Tab(icon: Icon(Icons.category), text: "Categories"),
//               Tab(icon: Icon(Icons.star), text: "Favourite"),
//             ],
//           ),
//         ),
//         body: TabBarView(children: [CategoryScreen(), FavouriteScreen()]),
//       ),
//     );
//   }
// }
class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {"page": CategoryScreen(), "title": "Categories"},
    {"page": FavouriteScreen(), "title": "Favourites"},
  ];
  int selectedTabInd = 0;

  @override
  Widget build(BuildContext context) {
    void onTabSelected(int index) {
      setState(() {
        selectedTabInd = index;
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text(_pages[selectedTabInd]["title"] as String)),
      drawer: MainDrawer(),
      body: _pages[selectedTabInd]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite"),
        ],
        currentIndex: selectedTabInd,
        onTap: onTabSelected,
      ),
    );
  }
}
