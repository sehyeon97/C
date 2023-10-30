import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/models/nutrient_info.dart';

// methods are triggered in the meal_details screen
// the provided data is consumed by meal_details for getting count of selected meals eaten,
// and by the daily_intake screen
class MealsNotifier extends StateNotifier<List<Meal>> {
  MealsNotifier() : super([]);

  void addMeal(Meal meal) {
    state = [...state, meal];
  }

  void removeMeal(Meal meal) {
    List<Meal> temp = [];
    temp.addAll(state);
    temp.remove(meal);
    state = temp;
  }

  NutritionInfo getNutritionInfo() {
    int calories = 0;
    double totalFat = 0;
    double saturatedFat = 0;
    double transFat = 0;
    double salt = 0;
    double carbs = 0;
    double fiber = 0;
    double sugar = 0;
    double protein = 0;

    for (Meal meal in state) {
      calories += int.parse(meal.nutritionInfo.calories);
      totalFat += double.parse(meal.nutritionInfo.totalFat);
      saturatedFat += double.parse(meal.nutritionInfo.saturatedFat);
      transFat += double.parse(meal.nutritionInfo.transFat);
      if (meal.category == 'c1' ||
          meal.category == 'c2' ||
          meal.category == 'c4') {
        salt += double.parse(meal.nutritionInfo.salt!);
      }
      carbs += double.parse(meal.nutritionInfo.carbs);
      fiber += double.parse(meal.nutritionInfo.fiber);
      sugar += double.parse(meal.nutritionInfo.sugar);
      protein += double.parse(meal.nutritionInfo.protein);
    }

    return NutritionInfo(
      calories: '$calories',
      totalFat: '$totalFat',
      saturatedFat: '$saturatedFat',
      transFat: '$transFat',
      salt: '$salt',
      carbs: '$carbs',
      fiber: '$fiber',
      sugar: '$sugar',
      protein: '$protein',
    );
  }
}

final mealsProvider = StateNotifierProvider<MealsNotifier, List<Meal>>((ref) {
  return MealsNotifier();
});
