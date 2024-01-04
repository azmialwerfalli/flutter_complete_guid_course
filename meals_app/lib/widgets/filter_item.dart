import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  const FilterItem({super.key,required this.titles,required this.subtitles,required this.filterValue});

final String titles;
final String subtitles;
  // final String titles;
  // final String subtitles;
final bool filterValue;
  
  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {

  // const filterValues = widget.filterValue.value;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterValue,
      onChanged: (isChecked) => setState(() => filterValue = isChecked),
      title: Text(
        widget.titles,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        widget.subtitles,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
set theme(bool filterValue) {
  filterValue = filterValue;
}