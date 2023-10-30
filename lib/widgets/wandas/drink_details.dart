import 'package:flutter/material.dart';
import 'package:meals/models/wandas/wandas_drinks.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({super.key});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  var _dropDownValue = 'None';
  bool addedShots = false;
  int currentShots = 0;
  Drink customDrink = Drink(
    id: 'custom',
    title: 'Custom Drink',
    calories: 0,
    sugar: 0,
    caffeine: 0,
    fat: 0,
  );

  void _onSelectEspressoShots(String shots) {
    switch (shots) {
      case 'None':
        if (addedShots) {
          addedShots = false;
          customDrink.removeEspressoShots(currentShots);
          currentShots = 0;
        }
        break;
      case 'One':
        if (addedShots && currentShots != 1) {
          customDrink.removeEspressoShots(currentShots);
          currentShots = 1;
        }
        customDrink.addEspressoShots(1);
        break;
      case 'Two':
        if (addedShots && currentShots != 2) {
          customDrink.removeEspressoShots(currentShots);
          currentShots = 2;
        }
        customDrink.addEspressoShots(2);
        break;
      case 'Three':
        if (addedShots && currentShots != 3) {
          customDrink.removeEspressoShots(currentShots);
          currentShots = 3;
        }
        customDrink.addEspressoShots(3);
        break;
      case 'Four':
        if (addedShots && currentShots != 4) {
          customDrink.removeEspressoShots(currentShots);
          currentShots = 4;
        }
        customDrink.addEspressoShots(4);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drink Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                const Text('Espresso Shots'),
                const SizedBox(width: 10),
                DropdownButton(
                  value: _dropDownValue,
                  items: const [
                    DropdownMenuItem(
                      value: 'None',
                      child: Text('None'),
                    ),
                    DropdownMenuItem(
                      value: 'One',
                      child: Text('One'),
                    ),
                    DropdownMenuItem(
                      value: 'Two',
                      child: Text('Two'),
                    ),
                    DropdownMenuItem(
                      value: 'Three',
                      child: Text('Three'),
                    ),
                    DropdownMenuItem(
                      value: 'Four',
                      child: Text('Four'),
                    ),
                  ],
                  onChanged: (String? newValue) => {
                    _dropDownValue = newValue!,
                    _onSelectEspressoShots(newValue),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
