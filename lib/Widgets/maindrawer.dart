import 'package:flutter/material.dart';
import '../Widgets/filtersscreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildlist(String title, IconData icon, Function taphand) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20,
            fontFamily: "RobotoCondensed",
            color: Colors.black,
            fontWeight: FontWeight.w900),
      ),
      onTap: taphand,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.amber,
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildlist("Cooking Up", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildlist("Filters ", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
