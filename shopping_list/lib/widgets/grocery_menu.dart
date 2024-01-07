import 'package:flutter/material.dart';
// import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryMenu extends StatefulWidget {
  const GroceryMenu({super.key});

  @override
  State<GroceryMenu> createState() => _GroceryMenuState();
}

class _GroceryMenuState extends State<GroceryMenu> {

  final List<GroceryItem> _greceryItems = [];
  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      
    _greceryItems.add(newItem);
    });
  }
  void _removeItem(GroceryItem item) {
    setState(() {
      _greceryItems.remove(item);
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No Items Added yet'),);
  // final void Function() onRemoveGrocery;
  if(_greceryItems.isNotEmpty){
    content =  ListView.builder(
        itemCount: _greceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction)=> _removeItem(_greceryItems[index]) ,
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
