import 'package:flutter/material.dart';
import '../Widgets/category_mael.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class Category_MealsScreen extends StatefulWidget {
  static const routeName = "category_meal";
  final List<Meal> available;

  const Category_MealsScreen(this.available);

  @override
  _Category_MealsScreenState createState() => _Category_MealsScreenState();
}

class _Category_MealsScreenState extends State<Category_MealsScreen> {
  String categoryTitle;
  List<Meal> categoryMeal;
  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    categoryMeal = widget.available.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void remoevid(String mealid) {
    setState(() {
      categoryMeal.removeWhere((element) => element.id == mealid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Category_Meal(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            imageUrl: categoryMeal[index].imageUrl,
            duration: categoryMeal[index].duration,
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
