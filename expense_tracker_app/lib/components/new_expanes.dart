import 'package:flutter/material.dart';
import 'package:expense_tracker_app/Models/expense.dart';

// import 'package:intl/intl.dart';
// import 'package:uuid/uuid.dart';

// const uuid = Uuid();
// final forrmatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpenese});
  final void Function(Expense expense) onAddExpenese;
  // Expense get getExpense => null;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  // final _amountController = TextEditingController();

  Category _selectedCategory = Category.leisure;
  // void _selectCategory(Category value) {
  //   setState(() {
  //     _selectedCategory = value;
  //     });
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    // final lastDate = DateTime(year);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // error
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please Make sure a valid title, date, amount was entered.'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Thanks'))
          ],
        ),
      );
      return;
    }
    // if(_amountController.text.isEmpty){
    //   return;
    // }
    widget.onAddExpenese(
      Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
    // Expense expense = Expense(
    //   title: _titleController.text,
    //   amount: amount,
    //   category: _selectedCategory,
    //   dateTime: _selectedDate!,
    //   );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: "Title",
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    labelText: "Amount",
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : forrmatter.format(_selectedDate!),
                    ),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(
                          Icons.calendar_month_rounded,
                        ))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    // if (value == null){
                    //   return;
                    // }
                    // value ?? return;
                    // value == null ? return;
                    if (value == null) return;

                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('Add Expense'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
