import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/data/wandas_data.dart';
import 'package:meals/models/wandas/wandas_drinks.dart';
import 'package:meals/providers/drinks_provider.dart';
import 'package:meals/widgets/wandas/drink_details.dart';
import 'package:meals/widgets/wandas/drinks_topbar.dart';

class Drinks extends ConsumerStatefulWidget {
  const Drinks({super.key});

  @override
  ConsumerState<Drinks> createState() {
    return _DrinksState();
  }
}

class _DrinksState extends ConsumerState<Drinks> {
  final _scrollController = ScrollController();

  // this is for the drink category and scroll positioning
  void _onSelectDrinkType(String drinkType) {}

  // this is for the individual items
  void _onSelectCoffee(Drink drink) {
    Navigator.of(context).push(MaterialPageRoute(builder: (contxt) {
      return DrinkDetails(
        drink: drink,
      );
    }));
  }

  void _onDeselectCoffee(Drink drink) {
    ref.read(drinksProvider.notifier).removeDrink(drink);
  }

  @override
  Widget build(BuildContext context) {
    List<Drink> drinks = ref.watch(drinksProvider);

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          TopBar(
            onSelectDrinkType: _onSelectDrinkType,
          ),
          const SizedBox(height: 8),
          const Text('Hot Coffee'),
          const SizedBox(height: 8),
          Column(
            children: [
              for (Drink drink in hotCoffee)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(drink.title),
                    IconButton(
                      onPressed: () {
                        _onDeselectCoffee(drink);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                        'x${(drinks.where((otherDrink) => otherDrink.id == drink.id)).length}'),
                    IconButton(
                      onPressed: () {
                        _onSelectCoffee(drink);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Cold Brew'),
          const SizedBox(height: 8),
          Column(
            children: [
              for (Drink drink in coldBrewIcedCoffee)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(drink.title),
                    IconButton(
                      onPressed: () {
                        _onDeselectCoffee(drink);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                        'x${(drinks.where((otherDrink) => otherDrink.id == drink.id)).length}'),
                    IconButton(
                      onPressed: () {
                        _onSelectCoffee(drink);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Frappucinos'),
          const SizedBox(height: 8),
          Column(
            children: [
              for (Drink drink in frappucinos)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(drink.title),
                    IconButton(
                      onPressed: () {
                        _onDeselectCoffee(drink);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                        'x${(drinks.where((otherDrink) => otherDrink.id == drink.id)).length}'),
                    IconButton(
                      onPressed: () {
                        _onSelectCoffee(drink);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
