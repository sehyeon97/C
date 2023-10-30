abstract class Milk {
  const Milk({
    required this.calories,
    required this.fat,
    required this.sugar,
  });

  final int calories;
  final int fat;
  final int sugar;
}

class WholeMilk implements Milk {
  @override
  final int calories = 160;

  @override
  final int fat = 8;

  @override
  final int sugar = 12;
}

class TwoPercentMilk implements Milk {
  @override
  final int calories = 80;

  @override
  final int fat = 4;

  @override
  final int sugar = 12;
}

class AlmondMilk implements Milk {
  @override
  final int calories = 60;

  @override
  final int fat = 4;

  @override
  final int sugar = 5;
}

class CoconutMilk implements Milk {
  @override
  final int calories = 80;

  @override
  final int fat = 5;

  @override
  final int sugar = 7;
}

class HeavyCream implements Milk {
  @override
  final int calories = 800;

  @override
  final int fat = 80;

  @override
  final int sugar = 6;
}

class NonFatMilk implements Milk {
  @override
  final int calories = 80;

  @override
  final int fat = 0;

  @override
  final int sugar = 12;
}

class OatMilk implements Milk {
  @override
  final int calories = 140;

  @override
  final int fat = 7;

  @override
  final int sugar = 7;
}

class SoyMilk implements Milk {
  @override
  final int calories = 130;

  @override
  final int fat = 4;

  @override
  final int sugar = 13;
}
