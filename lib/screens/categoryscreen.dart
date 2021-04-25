import 'package:flutter/material.dart';
import '../Widgets/categoyitem.dart';
import '../dummy_data.dart';

class Categoryscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(title: Text("meal" ),),
      body: GridView(
        children: DUMMY_CATEGORIES
            .map(
              (catData) =>
                  CategoryItems(catData.id, catData.title, catData.color),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
