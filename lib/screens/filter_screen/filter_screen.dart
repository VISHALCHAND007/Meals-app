import 'package:flutter/material.dart';
import 'package:meals_app/models/filter.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static final routeName = "/filters";
  final Function(Filter filters) setFilters;
  final Filter filters;

  const FilterScreen({super.key, required this.setFilters, required this.filters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Widget _buildSwitchListTile(
    String title,
    String description,
    bool value,
    Function(bool) setValue,
  ) {
    return SwitchListTile(
      value: value,
      onChanged: setValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVeg = false;
  var _isVegan = false;

  @override
  void initState() {
    _isGlutenFree = widget.filters.isGlutenFree;
    _isLactoseFree = widget.filters.isLactoseFree;
    _isVeg = widget.filters.isVegetarian;
    _isVegan = widget.filters.isVegan;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            onPressed: () => widget.setFilters(
              Filter(
                isGlutenFree: _isGlutenFree,
                isLactoseFree: _isLactoseFree,
                isVegetarian: _isVeg,
                isVegan: _isVegan,
              ),
            ),
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "Adjust your meal selection:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Gluten-Free",
                  "Only include gluten free meals.",
                  _isGlutenFree,
                  (value) {
                    // print(value);
                    setState(() {
                      _isGlutenFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Lactose-Free",
                  "Only include lactose free meals.",
                  _isLactoseFree,
                  (value) {
                    setState(() {
                      _isLactoseFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Only include vegan meals.",
                  _isVegan,
                  (value) {
                    setState(() {
                      _isVegan = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "Only include vegetarian meals.",
                  _isVeg,
                  (value) {
                    setState(() {
                      _isVeg = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
