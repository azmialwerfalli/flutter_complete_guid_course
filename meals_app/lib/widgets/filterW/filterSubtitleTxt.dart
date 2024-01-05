import 'package:flutter/material.dart';

class FilterSubtitle extends StatelessWidget {
  const FilterSubtitle({super.key, required this.subtitles});
  final subtitles;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitles,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }
}
