import 'package:flutter/material.dart';
import 'maindrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filter";
  final Function savefilter;
  final Map<String, bool> current;

  const FiltersScreen(this.savefilter, this.current);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  @override
  // ignore: must_call_super
  initState() {
    isGlutenFree = widget.current["Gluten"];
    isLactoseFree = widget.current["Lactose"];
    isVegan = widget.current["Vegan"];
    isVegetarian = widget.current["Vegetarian"];

    super.initState();
  }

  Widget listSwtchTile(bool currentvalue, Function updatevalue, String title,
      String description) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentvalue,
        onChanged: updatevalue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> selectedfilter = {
                "Gluten": isGlutenFree,
                "Lactose": isLactoseFree,
                "Vegan": isVegan,
                "Vegetarian": isVegetarian,
              };
              widget.savefilter(selectedfilter);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjus your meal selaetion',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                listSwtchTile(isGlutenFree, (nowvlue) {
                  setState(() {
                    isGlutenFree = nowvlue;
                  });
                }, "Gluten-Free", "only include GlutenFree-free meals"),
                listSwtchTile(isVegetarian, (nowvlue) {
                  setState(() {
                    isVegetarian = nowvlue;
                  });
                }, "Vegetarian-Free",
                    "only include Vegetarian-Free-free meals"),
                listSwtchTile(isLactoseFree, (nowvlue) {
                  setState(() {
                    isLactoseFree = nowvlue;
                  });
                }, "Lactose-Free", "only include Lactose-free meals"),
                listSwtchTile(isVegan, (nowvlue) {
                  setState(() {
                    isVegan = nowvlue;
                  });
                }, "Vegan-Free", "only include Vegan-free meals"),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
