import 'package:flutter/material.dart';
import '../screens/meal_detail.dart';

import '../models/meal.dart';

class MealWeiget extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealWeiget({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complex {
    if (complexity == Complexity.Simple) return "Simple";
    if (complexity == Complexity.Challenging) return "Challenging";
    if (complexity == Complexity.Hard) return "Hard";
    return "Eroor";
  }

  String get price {
    if (affordability == Affordability.Affordable) return "Affordable";
    if (affordability == Affordability.Pricey) return "Pricy";
    if (affordability == Affordability.Luxurious) return "Big-Budget";
    return "Eroor";
  }

  void _selectMealDetails(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetail.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMealDetails(context),
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complex),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 5,
                      ),
                      Text(price),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
