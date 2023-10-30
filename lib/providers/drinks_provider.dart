import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/wandas/wandas_drinks.dart';

class DrinksNotifier extends StateNotifier<List<Drink>> {
  DrinksNotifier() : super([]);

  void addDrink(Drink drink) {
    state = [...state, drink];
  }

  void removeDrink(Drink drink) {
    List<Drink> temp = [];
    temp.addAll(state);
    temp.remove(drink);
    state = temp;
  }

  int getNumOfDrinksByID(String id) {
    return state.where((anyDrink) => anyDrink.id == id).length;
  }

  Drink getDrinksNutritionInfo() {
    int calories = 0;
    int sugar = 0;
    int caffeine = 0;
    int fat = 0;

    for (Drink drink in state) {
      calories += drink.calories;
      sugar += drink.sugar;
      caffeine += drink.caffeine;
      fat += drink.fat;
    }

    return Drink(
      id: 'does-not-matter',
      title: 'Consumed Drinks',
      calories: calories,
      sugar: sugar,
      caffeine: caffeine,
      fat: fat,
    );
  }
}

final drinksProvider =
    StateNotifierProvider<DrinksNotifier, List<Drink>>((ref) {
  return DrinksNotifier();
});
