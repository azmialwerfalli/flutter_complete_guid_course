import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() => _selectedPageIndex = index,);
  }
  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1){
      activePage =  const MealsScreen(meals: []);
     activePageTitle = 'My Favorites';
    } 
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categoreis',),
          BottomNavigationBarItem(icon:  Icon(Icons.star),label: 'Favorites',),
          ],
      ),
    );
  }
}
