import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      // where meal id is not equil meal id
      state = state.where((m) => m.id == meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoritesMealsProvider = StateNotifierProvider((ref) => null);
