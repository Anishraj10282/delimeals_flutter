import 'package:delimeals/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilter;
  final Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter,this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState()
  {
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegeterian = widget.currentFilter['vegeterian'];
    _vegan = widget.currentFilter['vegan'];

    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String description, bool currentVal, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentVal,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Filters"),
        actions : [IconButton(icon:Icon(Icons.save), onPressed:(){
          final selectedFilters = {
        'gluten': _glutenFree,
        'lactose': _lactoseFree,
        'vegan': _vegan,
        'vegeterian': _vegeterian,
        };
        widget.setFilter(selectedFilters);
        })]),
        drawer: MainDrawer(),
        body: Column(children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust Your Meal Selection.',
                  style: Theme.of(context).textTheme.headline6)),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluteen-Free', 'Only Include Gluten-Free Meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildSwitchListTile(
                  'Lactose-Free', 'Only Include Lactose-Free Meals', _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
              buildSwitchListTile(
                  'Vegetarian', 'Only Include Vegetarian Meals', _vegeterian,
                      (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  }),
              buildSwitchListTile(
                  'Vegan', 'Only Include Vegan Meals', _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
            ],
          ))
        ]));
  }
}
