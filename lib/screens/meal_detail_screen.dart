import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetial_screen extends StatelessWidget {
  static const routeName = "mealdetail";
  final Function togglefavoret;
  final Function isfavoret;
  MealDetial_screen(this.togglefavoret, this.isfavoret);
  Widget buildcont(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildlistv(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final sleactidmeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text(sleactidmeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                sleactidmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildcont(context, "ingredients"),
            buildlistv(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(sleactidmeal.ingredients[index]),
                  ),
                ),
                itemCount: sleactidmeal.ingredients.length,
              ),
            ),
            buildcont(context, "steps"),
            buildlistv(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      title: Text(sleactidmeal.steps[index]),
                      leading: CircleAvatar(
                        child: Text("#${index + 1}"),
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: sleactidmeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => togglefavoret(mealid),
        child: Icon(
          isfavoret(mealid) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
