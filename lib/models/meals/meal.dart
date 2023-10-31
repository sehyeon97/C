import 'package:meals/models/results/nutrient_info.dart';

class Meal {
  const Meal({
    required this.id,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.nutritionInfo,
  });

  final String id;
  final String category;
  final String title;
  final String imageUrl;
  final NutritionInfo nutritionInfo;
}
