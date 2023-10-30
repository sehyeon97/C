import 'package:meals/models/wandas/milk.dart';

class Drink {
  Drink({
    required this.id,
    required this.title,
    required this.calories,
    required this.sugar,
    required this.caffeine,
    required this.fat,
  });

  final String id;
  final String title;
  int calories;
  int sugar;
  int caffeine;
  int fat;

  void addEspressoShots(int shots) {
    caffeine += shots * 75;
    calories += shots * 10;
  }

  void removeEspressoShots(int shots) {
    caffeine -= shots * 75;
    calories -= shots * 75;
  }

  void addMilk(List<Milk> milks) {
    for (Milk milk in milks) {
      calories += milk.calories;
      sugar += milk.sugar;
      fat += milk.fat;
    }
  }

  void removeMilk(List<Milk> milks) {
    for (Milk milk in milks) {
      calories -= milk.calories;
      sugar -= milk.sugar;
      fat -= milk.fat;
    }
  }

  void addToppings(List<String> toppings) {
    for (String topping in toppings) {
      if (topping == 'Caramel Drizzle') {
        calories += 15;
        fat += 1;
        sugar += 2;
      } else {
        calories += 5;
        sugar += 1;
      }
    }
  }

  void removeToppings(List<String> toppings) {
    for (String topping in toppings) {
      switch (topping) {
        case 'Caramel Drizzle':
          calories -= 15;
          fat -= 1;
          sugar -= 2;
          break;
        case 'Mocha Drizzle':
          calories -= 5;
          sugar -= 1;
          break;
        default:
      }
    }
  }

  int get totalCalories => calories;

  int get totalSugar => sugar;

  int get totalCaffeine => caffeine;

  int get totalFat => fat;
}
