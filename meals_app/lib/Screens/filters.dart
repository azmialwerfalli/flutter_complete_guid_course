import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widgets/filterW/filterSubtitleTxt.dart';
import 'package:meals_app/widgets/filterW/filtersTitleTxt.dart';
import 'package:meals_app/providers/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    final activeColors = Theme.of(context).colorScheme.tertiary;
    final contentPaddings = EdgeInsets.only(left: 34, right: 22);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body:  Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked),
              title: const FilterTitles(titles: 'Gluten-free'),
              subtitle: const FilterSubtitle(
                  subtitles: 'Only include Gluten-free Meals.'),
              activeColor: activeColors,
              contentPadding: contentPaddings,
            ),
            SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked),
              title: const FilterTitles(titles: 'Lactose-free'),
              subtitle: const FilterSubtitle(
                  subtitles: 'Only include Lactose-free Meals.'),
              activeColor: activeColors,
              contentPadding: contentPaddings,
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked),
              title: const FilterTitles(titles: 'Vegetarian Food'),
              subtitle: const FilterSubtitle(
                  subtitles: 'Only include Vegetarian Meals.'),
              activeColor: activeColors,
              contentPadding: contentPaddings,
            ),
            SwitchListTile(
               value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked),
              title: const FilterTitles(titles: 'Vegan Food'),
              subtitle:
                  const FilterSubtitle(subtitles: 'Only include Vegan Meals.'),
              activeColor: activeColors,
              contentPadding: contentPaddings,
            ),
          ],
        ),
      // ),
    );
  }
}
