import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Models/dummy_data.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}
