import 'package:delimeals/categories_screen.dart';
import 'package:delimeals/main_drawer.dart';
import 'package:delimeals/meal.dart';
import 'package:flutter/material.dart';
import './favorite_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, initialIndex: 0,child: Scaffold(
      appBar: AppBar(title: Text('Delimeals'),
      bottom:TabBar(
        tabs:[
          Tab(icon:Icon(Icons.category),text:'Categories'),
          Tab(icon:Icon(Icons.star),text:'Favorites'),
        ]
      )),
      drawer: MainDrawer(),
      body:TabBarView(children: [
        CategoriesScreen(),
        FavoriteScreen(widget.favoriteMeals),
      ],)
    ));
  }
}
