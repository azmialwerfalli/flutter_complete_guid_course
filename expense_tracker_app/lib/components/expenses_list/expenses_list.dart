import 'package:expense_tracker_app/Models/expense.dart';
import 'package:expense_tracker_app/components/expenses_list/expenese_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expensesList, required this.onRemoveExpenese, super.key});

  final List<Expense> expensesList;
  final void Function(Expense expense) onRemoveExpenese;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.errorContainer,
          margin: Theme.of(context).cardTheme.margin,
        ),
        key: ValueKey(expensesList[index]),
        onDismissed: (direction) {
          onRemoveExpenese(expensesList[index]);
        },
        child: ExpenseItem(expensesList[index]),
      ),
    );
  }
}
