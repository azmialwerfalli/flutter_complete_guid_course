import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      // where meal id is not equil meal id
      state = state.where((m) => m.id == meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesMealsProvider = StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) => FavoritesMealsNotifier());