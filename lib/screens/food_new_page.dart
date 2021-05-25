import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_weiget.dart';

class FoodNewPage extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeal;
  FoodNewPage(this.availableMeal);

  @override
  _FoodNewPageState createState() => _FoodNewPageState();
}

class _FoodNewPageState extends State<FoodNewPage> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final routetitle = routeArgs['title'];
    final routeid = routeArgs['id'];
    final categeryMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(routeid);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routetitle),
      ),
      body: categeryMeals.length != 0
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return MealWeiget(
                    id: categeryMeals[index].id,
                    title: categeryMeals[index].title,
                    imageUrl: categeryMeals[index].imageUrl,
                    duration: categeryMeals[index].duration,
                    complexity: categeryMeals[index].complexity,
                    affordability: categeryMeals[index].affordability);
              },
              itemCount: categeryMeals.length,
            )
          : Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Text(
                "Your Filtered Categery Food is not present.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
    );
  }
}
