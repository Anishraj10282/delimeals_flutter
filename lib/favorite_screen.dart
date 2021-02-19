import 'package:delimeals/meal.dart';
import 'package:flutter/material.dart';
import 'meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty)
      return Center(
          child: Text('You have no favorites yet - start adding some!'));
    else {
      return Center(
          child: ListView.builder(
          itemBuilder: (ctx, index)
      {
        return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity);
      },
    itemCount: favoriteMeals.length,));
    }
    }
}
