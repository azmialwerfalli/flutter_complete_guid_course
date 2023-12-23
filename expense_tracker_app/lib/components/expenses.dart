import 'package:expense_tracker_app/Models/expense.dart';
import 'package:expense_tracker_app/components/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/components/new_expanes.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Burger",
      amount: 12.5,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "16GB Ram",
      amount: 195.00,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _openAddExpeneseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const SingleChildScrollView(
        child: NewExpense(),
        // child: Text('modal Sheeti'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Azmi Expenese Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpeneseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            child: ExpensesList(
              expensesList: _registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
