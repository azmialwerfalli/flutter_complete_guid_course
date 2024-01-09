import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:shopping_list/data/dummy_items.dart';\
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
// import 'package:shopping_list/models/category.dart';

import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryMenu extends StatefulWidget {
  const GroceryMenu({super.key});

  @override
  State<GroceryMenu> createState() => _GroceryMenuState();
}

class _GroceryMenuState extends State<GroceryMenu> {
  List<GroceryItem> _greceryItems = [];
  var isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'flutter-prep-c52cb-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      _error = 'failed to fetch data try later';
      }
    // print(response.body);
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final categorizer = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      loadedItems.add(
        GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: categorizer
            ),
      );
      // _greceryItems.add(GroceryItem(id: item.key<
    }
    setState(() {
      _greceryItems = loadedItems;
      isLoading = false;
    });
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    if(newItem == null){
      return;
    }
    setState(() {
      _greceryItems.add(newItem);
    });

    // _loadItems();

    /// old local testing
    // if (newItem == null) {
    //   return;
    // }
    // setState(() {

    // _greceryItems.add(newItem);
    // });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _greceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No Items Added yet'),
    );
    if(isLoading){
      content = const Center(child: CircularProgressIndicator(),);
    }
    // final void Function() onRemoveGrocery;
    if (_greceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _greceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) => _removeItem(_greceryItems[index]),
          key: ValueKey(_greceryItems[index].id),
          child: ListTile(
            leading: Container(
              width: 24,
              height: 24,
              color: _greceryItems[index].category.color,
            ),
            title: Text(_greceryItems[index].name),
            trailing: Text(
              _greceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );
    }
    if(_error != null){
      content =  Center(child: Text(_error!));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: content,

      // ),
    );
  }
}
