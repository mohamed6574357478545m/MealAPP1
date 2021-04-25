import 'package:flutter/material.dart';
import 'package:flutter_appm/models/meal.dart';
import 'category_mael.dart';
import 'maindrawer.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoretmeal;

  const FavoritesScreen(this.favoretmeal);
  @override
  Widget build(BuildContext context) {
    if (favoretmeal.isEmpty) {
      return Center(
        child: Text(
          "Your  have no favorites",
          style: Theme.of(context).textTheme.title,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return Category_Meal(
            id: favoretmeal[index].id,
            title: favoretmeal[index].title,
            imageUrl: favoretmeal[index].imageUrl,
            duration: favoretmeal[index].duration,
            affordability: favoretmeal[index].affordability,
            complexity: favoretmeal[index].complexity,
          );
        },
        itemCount: favoretmeal.length,
      );
    }
  }
}
