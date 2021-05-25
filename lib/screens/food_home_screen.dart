import 'package:flutter/material.dart';
import '../widgets/food_weight.dart';
import '../dummy_data.dart';

class FoodHomeScreen extends StatefulWidget {
  @override
  _FoodHomeScreenState createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((item) {
        return FoodWeight(
          title: item.title,
          color: item.color,
          id: item.id,
        );
      }).toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
