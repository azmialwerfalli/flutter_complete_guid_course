import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  FilterItem({super.key,required this.filterValue});
  bool filterValue = false;
  
  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  // get filterValue => null;

    bool filterValue =false;             
  //  filterValue = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(value: filterValue,
            onChanged: (isChecked) =>
                setState(() => filterValue = isChecked),
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Gluten-free Meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          );
  }
}