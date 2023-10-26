import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

// this is a good example when the return value is a static variable and does not dynamically change
// with more complex cases, read the Provider in favorites_provider.dart
final mealsProvider = Provider((ref) {
  // returns what we are providing to other classes
  return dummyMeals;
});
