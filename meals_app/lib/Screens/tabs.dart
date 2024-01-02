import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/meals.dart';

import '../Models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavoriteStatus(Meal meal){
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting){
      _favoriteMeals.remove(meal);
    }else{
      _favoriteMeals.add(meal);
    }
  }


  void _selectPage(int index) {
    setState(() => _selectedPageIndex = index,);
  }
  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1){
      activePage =  MealsScreen(meals: [],onToggleFavorite: _toggleMealFavoriteStatus,);
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