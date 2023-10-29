import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/burger_info.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screens/tabs.dart';

class MealDetailsScreen extends ConsumerStatefulWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  ConsumerState<MealDetailsScreen> createState() {
    return _MealDetailsScreenState();
  }
}

class _MealDetailsScreenState extends ConsumerState<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Meal meal = widget.meal;
    final allSelectedMeals = ref.watch(mealsProvider);
    int numOfMeals =
        allSelectedMeals.where((anyMeal) => anyMeal.id == meal.id).length;

    void removeMeal() {
      if (numOfMeals > 0) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Removed meal from daily intake.'),
          ),
        );
        ref.read(mealsProvider.notifier).removeMeal(meal);
      }
    }

    void addMeal() {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Added meal to daily intake.'),
        ),
      );
      ref.read(mealsProvider.notifier).addMeal(meal);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (contxt) => const TabsScreen(),
                  ),
                  (route) => false);
            },
            icon: const Icon(Icons.home),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: removeMeal,
            icon: const Icon(Icons.remove_circle),
          ),
          Text('$numOfMeals'),
          IconButton(
            onPressed: addMeal,
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // easily animate a widget across different screens
            // the tag value is what tells flutter which widgets are being animated
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Nutrition Information',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            Table(
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FixedColumnWidth(180),
                1: FixedColumnWidth(120)
              },
              children: [
                TableRow(
                  children: [
                    const Center(
                      child: Text(
                        'Calories',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Center(child: Text(meal.nutritionInfo.calories)),
                  ],
                ),
                TableRow(
                  children: [
                    const Center(
                      child: Text(
                        'Total Fat',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Center(child: Text(meal.nutritionInfo.totalFat)),
                  ],
                ),
                TableRow(
                  children: [
                    const Center(
                      child: Text(
                        'Saturated Fat',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Center(child: Text(meal.nutritionInfo.saturatedFat)),
                  ],
                ),
                TableRow(
                  children: [
                    const Center(
                      child: Text(
                        'Trans Fat',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Center(child: Text(meal.nutritionInfo.transFat)),
                  ],
                ),
                if (meal.nutritionInfo is BurgerInfo)
                  TableRow(
                    children: [
                      const Center(
                        child: Text(
                          'Total Fat',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Center(child: Text(meal.nutritionInfo.totalFat)),
                    ],
                  ),
                TableRow(
                  children: [
                    const Center(
                      child: Text(
                        'Carbohydrates',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Center(child: Text(meal.nutritionInfo.carbs)),
                  ],
                ),
                TableRow(
                  children: [
                    const Center(
                      child: Text(
                        'Fiber',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Center(child: Text(meal.nutritionInfo.fiber)),
                  ],
                ),
                TableRow(
                  children: [
                    const Center(
                      child: Text(
                        'Sugar',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Center(child: Text(meal.nutritionInfo.sugar)),
                  ],
                ),
                TableRow(
                  children: [
                    const Center(
                      child: Text(
                        'Protein',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Center(child: Text(meal.nutritionInfo.protein)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
