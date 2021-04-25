import 'package:flutter/material.dart';
import './Widgets/filtersscreen.dart';
import './screens/category_meal_screen.dart';
import './screens/categoryscreen.dart';
import './screens/meal_detail_screen.dart';
import 'Widgets/tapsscreen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    "Gluten": false,
    "Lactose": false,
    "Vegan": false,
    "Vegetarian": false,
  };
  List<Meal> _available = DUMMY_MEALS;
  List<Meal> favoretmeal = [];

  bool _ismealfavoret(String id) {
    return favoretmeal.any((element) => element.id == id);
  }

  void _togglfavoret(String mealid) {
    final exactindex =
        favoretmeal.indexWhere((element) => element.id == mealid);
    if (exactindex >= 0) {
      setState(() {
        favoretmeal.removeAt(exactindex);
      });
    } else {
      setState(() {
        favoretmeal
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealid));
      });
    }
  }

  void selectfiltetrs(Map<String, bool> filterdata) {
    setState(() {
      _filter = filterdata;
      _available = DUMMY_MEALS.where((item) {
        if (_filter["Gluten"] && !item.isGlutenFree) {
          return false;
        }

        if (_filter["Lactose"] && !item.isLactoseFree) {
          return false;
        }
        if (_filter["Vegan"] && !item.isVegan) {
          return false;
        }
        if (_filter["Vegetarian"] && !item.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 224, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(255, 254, 224, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(255, 222, 224, 1),
                ),
                title: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        //   home: MyHomePage(),
        //  home: Categoryscreen(),
        routes: {
          '/': (ctx) => TabsScreen(favoretmeal),
          Category_MealsScreen.routeName: (context) =>
              Category_MealsScreen(_available),
          MealDetial_screen.routeName: (context) =>
              MealDetial_screen(_togglfavoret, _ismealfavoret),
          FiltersScreen.routeName: (context) =>
              FiltersScreen(selectfiltetrs, _filter),
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal"),
      ),
      body: Categoryscreen(),
    );
  }
}
