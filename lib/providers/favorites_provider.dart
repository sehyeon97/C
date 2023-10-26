import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

// naming convention to end class name with Notifier
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // initial value
  // we pass our initial value to our parent
  FavoriteMealsNotifier() : super([]);

  // In notifiers, you are not allowed to edit an existing value in memory
  // instead you must always create a new one to replace the value
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    // for adding a meal to state if state.where returns true
    // or removing a meal from state when false
    if (mealIsFavorite) {
      // with where, you filter a list and obtain a new list
      // if the meal in state list is not the toggled meal, then remove it from state
      state = state.where((meeaal) => meeaal.id != meal.id).toList();
      return false;
    } else {
      // for adding a meal to state
      // pull out all data from current state and add meal then set it equal to state
      state = [...state, meal];
      return true;
    }
  }

  // all methods that should exist to change the value above
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
