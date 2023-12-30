import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text('1', style: TextStyle(color: Colors.teal),),
          Text('2', style: TextStyle(color: Colors.teal),),
          Text('3', style: TextStyle(color: Colors.teal),),
          Text('4', style: TextStyle(color: Colors.teal),),
          Text('5', style: TextStyle(color: Colors.teal),),
          Text('6', style: TextStyle(color: Colors.teal),),
        ],
      ),
    );
  }
}
