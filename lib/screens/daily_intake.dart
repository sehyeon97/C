import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

import 'package:meals/models/nutrient_info.dart';
import 'package:meals/providers/drinks_provider.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screens/meal_details.dart';

class DailyIntake extends ConsumerStatefulWidget {
  const DailyIntake({
    super.key,
  });

  @override
  ConsumerState<DailyIntake> createState() {
    return _DailyIntakeState();
  }
}

class _DailyIntakeState extends ConsumerState<DailyIntake> {
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (contxt) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    NutritionInfo nutritionInfo =
        ref.read(mealsProvider.notifier).getNutritionInfo();
    var drinkNutritionInfo =
        ref.watch(drinksProvider.notifier).getDrinksNutritionInfo();
    int calories =
        int.parse(nutritionInfo.calories) + drinkNutritionInfo.calories;
    double sugar = double.parse(nutritionInfo.sugar) + drinkNutritionInfo.sugar;
    int caffeine = drinkNutritionInfo.caffeine;
    double fat = double.parse(nutritionInfo.totalFat) + drinkNutritionInfo.fat;

    return SingleChildScrollView(
      child: Center(
        heightFactor: 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Calories',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$calories',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Total Fat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$fat g',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Saturated Fat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${nutritionInfo.saturatedFat} g',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Trans Fat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${nutritionInfo.transFat} g',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Sodium',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${nutritionInfo.salt} g',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Carbs',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${nutritionInfo.carbs} g',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Fiber',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${nutritionInfo.fiber} g',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Sugar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$sugar g',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Protein',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${nutritionInfo.protein} g',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Caffeine',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$caffeine mg',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Meals Eaten',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            for (Meal meal in ref.watch(mealsProvider))
              Card(
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.hardEdge,
                elevation: 2,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contxt) => MealDetailsScreen(
                              meal: meal,
                            ),
                          ),
                        );
                      },
                      child: Image.network(meal.imageUrl),
                    ),
                    Text(meal.title),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
