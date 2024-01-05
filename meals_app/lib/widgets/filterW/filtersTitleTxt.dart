import 'package:flutter/material.dart';

class FilterTitles extends StatelessWidget {
  const FilterTitles({super.key, required this.titles});
  final titles;

  @override
  Widget build(BuildContext context) {
    return Text(
      titles,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }
}
