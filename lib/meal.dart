import 'package:flutter/material.dart';

enum Complexity{
  Simple,
  Challenging,
  Hard,
}

enum Affordability
{
  Affordable,
  Pricey,
  Luxurious,
}

class Meal
{
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final int duration;
  final List<String> steps;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isLactoseFree;
  final bool isVegetarian;

  const Meal({@required this.id, @required this.categories,@required this.title,
         @required this.imageUrl, @required this.ingredients, @required this.duration,
        @required this.affordability, @required this.complexity, @required this.steps,
        @required this.isGlutenFree, @required this.isVegan, @required this.isLactoseFree,
        @required this.isVegetarian});

}