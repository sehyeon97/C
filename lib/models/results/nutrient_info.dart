class NutritionInfo {
  const NutritionInfo({
    required this.calories,
    required this.totalFat,
    required this.saturatedFat,
    required this.transFat,
    required this.carbs,
    required this.fiber,
    required this.sugar,
    required this.protein,
    this.salt,
  });

  final String calories;
  final String totalFat;
  final String saturatedFat;
  final String transFat;
  final String carbs;
  final String fiber;
  final String sugar;
  final String protein;
  final String? salt;
}
