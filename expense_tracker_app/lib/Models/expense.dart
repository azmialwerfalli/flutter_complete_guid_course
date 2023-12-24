// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final forrmatter = DateFormat.yMd();

enum Category {
  investment,
  saving,
  fitness,
  internet,
  travel,
  car,
  clothes,
  service,
  work,
  leisure,
  food,

  // restaurants,

  // entertainment,
}

const categoryIcons = {
  Category.food: Icons.shopping_cart_rounded,
  // Category.restaurants: Icons.lunch_dining_rounded,

  Category.clothes: Icons.checkroom,
  // Category.car: Icons.checkroom,
  Category.fitness: Icons.fitness_center,
  Category.car: Icons.drive_eta,
  Category.service: Icons.handyman,
  Category.internet: Icons.wifi,
  Category.travel: Icons.flight_takeoff_rounded,

  Category.leisure: Icons.movie_filter_rounded,
  Category.work: Icons.work_rounded,
  Category.investment: Icons.show_chart,
  Category.saving: Icons.monetization_on_rounded,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate => forrmatter.format(date);
}

class ExpeneseBucket {
  const ExpeneseBucket({
    required this.category,
    required this.expenses,
  });

  ExpeneseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((element) => element.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final element in expenses) {
      sum += element.amount;
    }
    return sum;
  }

  // ExpeneseBucket({required this.name, required this.icon});
  // factory ExpeneseBucket.fromJson(Map<String, dynamic> json) {
  //   return ExpeneseBucket(
  //     name: json['name'],
  //     icon: IconData(json['icon'] as int, fontFamily: 'MaterialIcons')
  //     );
  //     }
}
