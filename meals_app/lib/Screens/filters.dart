import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals_app/Screens/tabs.dart';
import 'package:meals_app/widgets/filterW/filterSubtitleTxt.dart';
import 'package:meals_app/widgets/filterW/filtersTitleTxt.dart';
import 'package:meals_app/providers/filter_provider.dart';
// import 'package:meals_app/widgets/filter_item.dart';

// import '../widgets/main_drawer.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({
    super.key,
    // required this.currentFilters,
  });
  // final Map<Filter, bool> currentFilters;

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilter = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilter[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilter[Filter.lactoseFree]!;
    _vegetarianFilterSet = activeFilter[Filter.vegetarian]!;
    _veganFilterSet = activeFilter[Filter.vegan]!;
  }

  // void _setScreen(String identifier) {
  //   Navigator.of(context).pop();
  //   if (identifier == 'meals') {
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (ctx) => const TabsScreen()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final activeColors = Theme.of(context).colorScheme.tertiary;
    final contentPaddings = EdgeInsets.only(left: 34, right: 22);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: _setScreen,
      // ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          // Navigator.of(context).pop();
          // return Future.value(false);
          return true;
        },
        child: Column(
          children: [
            // FilterItem(widget.)
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) =>
                  setState(() => _glutenFreeFilterSet = isChecked),
              title: const FilterTitles(titles: 'Gluten-free'),
              subtitle: const FilterSubtitle(
                  subtitles: 'Only include Gluten-free Meals.'),
              activeColor: activeColors,
              contentPadding: contentPaddings,
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) =>
                  setState(() => _lactoseFreeFilterSet = isChecked),
              title: const FilterTitles(titles: 'Lactose-free'),
              subtitle: const FilterSubtitle(
                  subtitles: 'Only include Lactose-free Meals.'),
              activeColor: activeColors,
              contentPadding: contentPaddings,
            ),
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked) =>
                  setState(() => _vegetarianFilterSet = isChecked),
              title: const FilterTitles(titles: 'Vegetarian Food'),
              subtitle: const FilterSubtitle(
                  subtitles: 'Only include Vegetarian Meals.'),
              activeColor: activeColors,
              contentPadding: contentPaddings,
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) =>
                  setState(() => _veganFilterSet = isChecked),
              title: const FilterTitles(titles: 'Vegan Food'),
              subtitle:
                  const FilterSubtitle(subtitles: 'Only include Vegan Meals.'),
              activeColor: activeColors,
              contentPadding: contentPaddings,
            ),
          ],
        ),
      ),
    );
  }
}
