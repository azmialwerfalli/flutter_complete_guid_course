import 'package:expense_tracker_app/Models/expense.dart';
import 'package:expense_tracker_app/components/chart/chart.dart';
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
    // Expense(
    //   title: "Burger",
    //   amount: 12.5,
    //   date: DateTime.now(),
    //   category: Category.food,
    // ),
  ];

  void _openAddExpeneseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpenese: _addExpenese),
    );
  }

  void _addExpenese(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpenese(Expense expense) {
    final expeneseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); 
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Expenese Deleted'),
        action: SnackBarAction(label: 'Undo', onPressed: (){
          setState(() {
            _registeredExpenses.insert(expeneseIndex, expense);
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    MediaQuery.of(context).size.height;
    Widget mainContent = const Center(
      child: Text('You didnt added any Expeneses Yet please Add some'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expensesList: _registeredExpenses,
        onRemoveExpenese: _removeExpenese,
      );
    }
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
          // Padding(
            // padding: const EdgeInsets.symmetric(vertical: 5),
             Chart(expenses: _registeredExpenses),
          // ),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
