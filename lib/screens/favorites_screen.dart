import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_weiget.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeal;
  FavoriteScreen(this._favoriteMeal);

  Widget build(BuildContext context) {
    return _favoriteMeal.length == 0
        ? Center(
            child: Text("You are not added any favorites yet."),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealWeiget(
                  id: _favoriteMeal[index].id,
                  title: _favoriteMeal[index].title,
                  imageUrl: _favoriteMeal[index].imageUrl,
                  duration: _favoriteMeal[index].duration,
                  complexity: _favoriteMeal[index].complexity,
                  affordability: _favoriteMeal[index].affordability);
            },
            itemCount: _favoriteMeal.length,
          );
  }
}
