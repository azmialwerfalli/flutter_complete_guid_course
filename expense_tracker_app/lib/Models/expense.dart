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
const categoruIcons = {
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
