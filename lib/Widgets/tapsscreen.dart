import 'package:flutter/material.dart';
import 'package:flutter_appm/models/meal.dart';
import '../Widgets/favoritesscreen.dart';
import '../screens/categoryscreen.dart';
import 'maindrawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoretmeal;

  const TabsScreen(this.favoretmeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;
  @override
  initState() {
    pages = [
      {"Page": Categoryscreen(), "title": "Category"},
      {"Page": FavoritesScreen(widget.favoretmeal), "title": "Favorites"}
    ];
    super.initState();
  }

  int slectetpageindes = 0;

  void slectetpage(int value) {
    setState(() {
      slectetpageindes = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[slectetpageindes]['title']),
      ),
      body: pages[slectetpageindes]['Page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: slectetpage,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: slectetpageindes,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
