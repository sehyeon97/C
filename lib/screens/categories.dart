import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/screens/wandas_coffee.dart';
import 'package:meals/widgets/category_grid_item.dart';

// changed from stateless to stateful widget for animations
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
  });

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// with keyword is like merging my class with another class
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // this in the end is a variable but not yet initialized when class is created
  // late keyword description ^
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // vsync needs SingleTickerProviderStateMixin
    // if you have multiple tickers, remove Single
    _animationController = AnimationController(
      vsync: this, // this is like fps
      duration: const Duration(milliseconds: 300), // duration of animation
      // these are default bound values so not necessary
      // however every animation requires bounds and u can change them
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  // to avoid potential memory overflows caused by animations
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final meals =
        mealsData.where((meal) => meal.category == category.id).toList();
    // same as Navigator.of(context).push(route)
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (contxt) => MealsScreen(
                  title: category.title,
                  meals: meals,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2, // sizing of grid items
          crossAxisSpacing: 20, // horizontal spacing
          mainAxisSpacing: 20, // vertical spacing between items
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (contxt) => const WandasCoffeeScreen(),
                ),
              );
            },
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 197, 143, 123),
                    Color.fromARGB(255, 197, 143, 123),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                'Wanda\'s Coffee',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          ),
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          // 0 - no offset, 1 - 100% offset
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
          // parent - thing that controls animation
          // curve - built in Flutter animation Curves
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut),
        ),
        child: child,
      ),
    );
  }
}
