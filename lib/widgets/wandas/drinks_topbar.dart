import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.onSelectDrinkType,
  });

  final void Function(
    String drinkType,
  ) onSelectDrinkType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <TextButton>[
          TextButton(
            onPressed: () {
              onSelectDrinkType('Hot Coffee');
            },
            child: const Text('Hot Coffee'),
          ),
          TextButton(
            onPressed: () {
              onSelectDrinkType('Cold Coffee');
            },
            child: const Text('Cold Coffee'),
          ),
          TextButton(
            onPressed: () {
              onSelectDrinkType('Cold Brew');
            },
            child: const Text('Cold Brew'),
          ),
          TextButton(
            onPressed: () {
              onSelectDrinkType('Frappucinos');
            },
            child: const Text('Frappucinos'),
          ),
          TextButton(
            onPressed: () {
              onSelectDrinkType('Smoothies');
            },
            child: const Text('Smoothies'),
          ),
        ],
      ),
    );
  }
}
