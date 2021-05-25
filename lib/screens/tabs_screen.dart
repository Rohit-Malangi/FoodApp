import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/drawer_widget.dart';
import './favorites_screen.dart';
import './food_home_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeal;
  TabsScreen(this._favoriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {'page': FoodHomeScreen(), 'title': 'My Recipe'},
      {'page': FavoriteScreen(widget._favoriteMeal), 'title': 'Favorites'},
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        /* DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('My Recipe'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.category), text: 'Categories'),
                Tab(icon: Icon(Icons.star), text: 'favorite'),
              ],
            ),
          ),
          body: TabBarView(children: [
            FoodHomeScreen(),
            FavoriteScreen(),
          ])),   */
        Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: DrawerWidget(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorites"),
        ],
      ),
    );
  }
}
