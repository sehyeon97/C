import 'package:meals/models/nutrient_info.dart';

class BurgerInfo extends NutritionInfo {
  const BurgerInfo({
    required super.calories,
    required super.totalFat,
    required super.saturatedFat,
    required super.transFat,
    required super.carbs,
    required super.fiber,
    required super.sugar,
    required super.protein,
    required this.salt,
  });

  final String salt;
}
