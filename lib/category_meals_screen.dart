import 'package:delimeals/meal_item.dart';
import 'package:flutter/material.dart';
import './meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen>{

  String categoryTitle;
  List<Meal> categoryMeals;
  bool _loadedInitData = false;

  @override
  void initState()
  {
    super.initState();

  }

  @override
  void didChangeDependencies()
  {
    if(_loadedInitData==false) {
      final routeArgs = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
    }


void removeMeal(String mealId)
{
    setState(() {
      categoryMeals.removeWhere((element) => element.id==mealId);
    });
}

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: Center(
            child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id : categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,);
          },
          itemCount: categoryMeals.length,
        )));
  }
}
