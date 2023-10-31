import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meals/meal.dart';

import 'package:meals/models/results/nutrient_info.dart';
import 'package:meals/providers/drinks_provider.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screens/meals/meal_details.dart';
import 'package:meals/widgets/results/intake_result.dart';
import 'package:meals/widgets/results/intake_result_title.dart';

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
            const ResultTitle(title: 'Calories'),
            const SizedBox(height: 8),
            ResultText(
              result: '$calories',
              unit: '',
            ),
            const SizedBox(height: 8),
            const ResultTitle(title: 'Total Fat'),
            const SizedBox(height: 8),
            ResultText(
              result: '$fat',
              unit: 'g',
            ),
            const SizedBox(height: 8),
            const ResultTitle(title: 'Saturated Fat'),
            const SizedBox(height: 8),
            ResultText(
              result: nutritionInfo.saturatedFat,
              unit: 'g',
            ),
            const SizedBox(height: 8),
            const ResultTitle(title: 'Trans Fat'),
            const SizedBox(height: 8),
            ResultText(
              result: nutritionInfo.transFat,
              unit: 'g',
            ),
            const SizedBox(height: 8),
            const ResultTitle(title: 'Sodium'),
            const SizedBox(height: 8),
            ResultText(
              result: nutritionInfo.salt!,
              unit: 'g',
            ),
            const SizedBox(height: 8),
            const ResultTitle(title: 'Carbs'),
            const SizedBox(height: 8),
            ResultText(
              result: nutritionInfo.carbs,
              unit: 'g',
            ),
            const SizedBox(height: 8),
            const ResultTitle(title: 'Fiber'),
            const SizedBox(height: 8),
            ResultText(
              result: nutritionInfo.fiber,
              unit: 'g',
            ),
            const SizedBox(height: 8),
            const ResultTitle(title: 'Sugar'),
            const SizedBox(height: 8),
            ResultText(
              result: '$sugar',
              unit: 'g',
            ),
            const SizedBox(height: 8),
            const ResultTitle(title: 'Protein'),
            const SizedBox(height: 8),
            ResultText(
              result: nutritionInfo.protein,
              unit: 'g',
            ),
            const SizedBox(height: 8),
            const ResultTitle(title: 'Caffeine'),
            const SizedBox(height: 8),
            ResultText(
              result: '$caffeine',
              unit: 'mg',
            ),
            const SizedBox(height: 16),
            const ResultTitle(title: 'Meals Eaten'),
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
