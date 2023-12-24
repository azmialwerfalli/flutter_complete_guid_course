import 'package:expense_tracker_app/Models/expense.dart';
// import 'package:expense_tracker_app/components/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    // Text(expense.category.name),
                    // shape
                    Icon(categoryIcons[expense.category],size: 28),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          expense.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 5),
                        Text(expense.formattedDate),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Text('\$${expense.amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
