import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal_details';
  final Function _toggleFavorite;
  final Function _isMealFavorite;
  MealDetail(this._toggleFavorite, this._isMealFavorite);

  Widget buildTitle(BuildContext context, String str) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        str,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildBox(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, "Ingridents"),
            buildBox(
              ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(selectMeal.ingredients[index]),
                        ),
                      ),
                  itemCount: selectMeal.ingredients.length),
            ),
            buildTitle(context, "Steps"),
            buildBox(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.black,
        child: Icon(
            _isMealFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
        onPressed: () => _toggleFavorite(mealId),
      ),
    );
  }
}
