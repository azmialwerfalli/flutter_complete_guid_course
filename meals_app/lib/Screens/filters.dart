import 'package:flutter/material.dart';
import 'package:meals_app/Screens/tabs.dart';
import 'package:meals_app/widgets/filter_item.dart';

// import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'meals') {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: _setScreen,
      // ),
      body: Column(
        children: [
          FilterItem(widget.)
          // SwitchListTile(
          //   value: _glutenFreeFilterSet,
          //   onChanged: (isChecked) =>
          //       setState(() => _glutenFreeFilterSet = isChecked),
          //   title: Text(
          //     'Gluten-free',
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   subtitle: Text(
          //     'Only include Gluten-free Meals.',
          //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   activeColor: Theme.of(context).colorScheme.tertiary,
          //   contentPadding: const EdgeInsets.only(left: 34, right: 22),
          // )
        ],
      ),
    );
  }
}
