import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
// import 'package:shopping_list/models/category.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _username = '';
  var _password = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final url = Uri.https('10.0.2.2:7026', '/api/Users/UsersCreat');
      http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
            "fullName": "string",
            "phone": "0923319216",
            "userName": _username,
            "password": _password,
            "role": "admin",
            "isActive": true,
            "freeType": true,
            "regesterDate": "2024-01-07",
            "startDate": "2024-01-07",
            "endDate": "2024-01-07"
            // 'categoryId': _selectedCategory.title,
          },
        ),
      );
      // T E S T I N G - V A L U E S
      // print(_enteredName);
      // print(_enteredQuantity);
      // print(_selectedCategory);
      // E N D - O F - T E S T
      // Navigator.of(context).pop(
      //   GroceryItem(
      //     id: DateTime.now().toString(),
      //     name: _enteredName,
      //     quantity: _enteredQuantity,
      //     category: _selectedCategory,
      //   ),
      // );
    }
  }

  void _resetItems() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('add new item'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('Usename'),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1 ||
                          value.trim().length > 50) {
                        return 'Username';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('password'),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1 ||
                          value.trim().length > 50) {
                        return 'password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  // TextFormField(
                  //   maxLength: 50,
                  //   decoration: const InputDecoration(
                  //     label: Text('name'),
                  //   ),
                  //   validator: (value) {
                  //     if (value == null ||
                  //         value.isEmpty ||
                  //         value.trim().length <= 1 ||
                  //         value.trim().length > 50) {
                  //       return 'Must Be Between 1 and 50 characters';
                  //     }
                  //     return null;
                  //   },
                  //   onSaved: (value) {
                  //     _enteredName = value!;
                  //   },
                  // ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     Expanded(
                  //       child: TextFormField(
                  //         decoration: const InputDecoration(
                  //           label: Text('Qunatity'),
                  //         ),
                  //         keyboardType: TextInputType.number,
                  //         initialValue: _enteredQuantity.toString(),
                  //         validator: (value) {
                  //           if (value == null ||
                  //               value.isEmpty ||
                  //               int.tryParse(value) == null ||
                  //               int.tryParse(value)! <= 0) {
                  //             return 'Must be a valide, positve Number.';
                  //           }
                  //           return null;
                  //         },
                  //         onSaved: (value) {
                  //           _enteredQuantity = int.parse(value!);
                  //         },
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 8,
                  //     ),
                  //     Expanded(
                  //       child: DropdownButtonFormField(
                  //         value: _selectedCategory,
                  //         items: [
                  //           for (final category in categories.entries)
                  //             DropdownMenuItem(
                  //               value: category.value,
                  //               child: Row(
                  //                 children: [
                  //                   Container(
                  //                     width: 16,
                  //                     height: 16,
                  //                     color: category.value.color,
                  //                   ),
                  //                   const SizedBox(
                  //                     width: 6,
                  //                   ),
                  //                   Text(category.value.title)
                  //                 ],
                  //               ),
                  //             ),
                  //         ],
                  //         onChanged: (value) {
                  //           setState(() {
                  //             _selectedCategory = value!;
                  //           });
                  //         },
                  //       ),
                  // ),

                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: _resetItems,
                        child: const Text('Reset'),
                      ),
                      ElevatedButton(
                        onPressed: _saveItem,
                        child: const Text('Add item'),
                      )
                    ],
                  ),
                  // ],
                ]))));

    //   ),
    // );
  }
}
