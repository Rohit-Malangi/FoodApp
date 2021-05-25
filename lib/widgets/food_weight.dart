import 'package:flutter/material.dart';
import '../screens/food_new_page.dart';

class FoodWeight extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const FoodWeight({this.title, this.color, this.id});

  void _selectfood(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(FoodNewPage.routeName, arguments: {
      'id': id,
      'title': title,
    }
        /* MaterialPageRoute(builder: (_) {
           return FoodNewPage(title);
           }),  */
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectfood(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
