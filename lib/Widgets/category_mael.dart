import 'package:flutter/material.dart';
import 'package:flutter_appm/models/meal.dart';
import '../screens/meal_detail_screen.dart';

class Category_Meal extends StatelessWidget {
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String title;

  const Category_Meal({
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.title,
    @required this.id,
  });

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "unknow";
        break;
    }
  }

  String get complixetyText {
    switch (complexity) {
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Simple:
        return "Simple";
        break;
      default:
        return "unknow";
        break;
    }
  }

  void sleactmael(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetial_screen.routeName,
      arguments: id,
    )
        .then((resolt) {
      // if (resolt != null) removeitem(resolt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => sleactmael(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl),
                ),
                Positioned(
                  right: 10,
                  bottom: 22,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 22),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_alarm_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text("$duration min",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complixetyText,
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(
                        affordabilityText,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
