import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals/model/meal_model.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.title, required this.meals});
  final String title;
  final List<MealModel> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: ((context, index) => Text(meals[index].title)),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Text(
          "No meals found",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
