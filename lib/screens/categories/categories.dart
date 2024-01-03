import 'package:flutter/material.dart';
import 'package:meals_app/common/widgets/category_item.dart';
import 'package:meals_app/screens/categories/data/categories_data.dart';
import 'package:meals_app/screens/categories/model/category_model.dart';
import 'package:meals_app/screens/meals/data/meal_data.dart';
import 'package:meals_app/screens/meals/meals.dart';
import 'package:meals_app/screens/meals/model/meal_model.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  // ignore: unused_element
  void _navigateToCategory(BuildContext context, CategoryModel category) {
    List<MealModel> filteredMeal;
    filteredMeal = mealsData
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    if (filteredMeal.isEmpty) {
      filteredMeal = [];
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Meals(title: category.title, meals: filteredMeal)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in categories)
            InkWell(
              onTap: () {
                _navigateToCategory(context, category);
              },
              splashColor: Theme.of(context).primaryColor,
              child: CategoryItem(category: category),
            )
        ],
      ),
    );
  }
}
