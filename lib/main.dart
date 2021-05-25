import 'package:flutter/material.dart';

import '../dummy_data.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail.dart';
import './screens/food_home_screen.dart';
import './screens/food_new_page.dart';
import './screens/filter.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];
  void _setFilter(Map<String, bool> filter) {
    setState(() {
      _filters = filter;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (meal.isGlutenFree && !_filters['gluten']) return false;
        if (meal.isVegan && !_filters['vegan']) return false;
        if (meal.isVegetarian && !_filters['vegetarian']) return false;
        if (meal.isLactoseFree && !_filters['lactose']) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final exitstingIndex =
        _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    setState(() {
      if (exitstingIndex > -1)
        _favoriteMeal.removeAt(exitstingIndex);
      else
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    });
  }

  bool _isMealFavorite(String id) => _favoriteMeal.any((meal) => meal.id == id);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Recipe',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        secondaryHeaderColor: Colors.green,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RaleWay',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      //home: FoodHomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeal),
        FoodNewPage.routeName: (ctx) => FoodNewPage(_availableMeal),
        MealDetail.routeName: (ctx) =>
            MealDetail(_toggleFavorite, _isMealFavorite),
        Filter.routeName: (ctx) => Filter(_filters, _setFilter),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => FoodHomeScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => FoodHomeScreen());
      },
    );
  }
}
