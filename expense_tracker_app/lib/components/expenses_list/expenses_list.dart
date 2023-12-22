import 'package:expense_tracker_app/Models/expense.dart';
import 'package:expense_tracker_app/components/expenses_list/expenese_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.expensesList, super.key});

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => ExpenseItem(
        expensesList[index],
      ),
      itemCount: expensesList.length,
    );
  }
}
