import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final mealsOfThisCategory = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: mealsOfThisCategory[index].id,
              title: mealsOfThisCategory[index].title,
              imageUrl: mealsOfThisCategory[index].imageUrl,
              duration: mealsOfThisCategory[index].duration,
              complexity: mealsOfThisCategory[index].complexity,
              affordability: mealsOfThisCategory[index].affordability);
        },
        itemCount: mealsOfThisCategory.length,
      ),
    );
  }
}
