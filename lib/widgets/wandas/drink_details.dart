import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/wandas/milk.dart';
import 'package:meals/models/wandas/wandas_drinks.dart';
import 'package:meals/providers/drinks_provider.dart';

class DrinkDetails extends ConsumerStatefulWidget {
  const DrinkDetails({
    super.key,
    required this.drink,
  });

  final Drink drink;

  @override
  ConsumerState<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends ConsumerState<DrinkDetails> {
  bool addedShots = false;
  int currentShots = 0;

  var selectedMilk;
  Map<String, Milk> milks = {
    'Whole Milk': WholeMilk(),
    '2% Milk': TwoPercentMilk(),
    'Almond Milk': AlmondMilk(),
    'Coconut Milk': CoconutMilk(),
    'Heavy Cream': HeavyCream(),
    'Nonfat Milk': NonFatMilk(),
    'Oat Milk': OatMilk(),
    'Soy Milk': SoyMilk(),
  };

  late String _dropDownEspresso;
  late String _dropDownMilk;
  late String _dropDownTopping;

  @override
  void initState() {
    super.initState();
    _dropDownEspresso = 'None';
    _dropDownMilk = 'Default';
    _dropDownTopping = 'None';
  }

  void _onSelectEspressoShots(String shots, Drink customDrink) {
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

    setState(() {
      _dropDownEspresso = shots;
    });
  }

  void _onSelectMilk(String milk) {
    if (milks.containsKey(milk)) {
      selectedMilk = milks[milk];
    }

    setState(() {
      _dropDownMilk = milk;
    });
  }

  void _onSelectToppings(String topping) {
    setState(() {
      _dropDownTopping = topping;
    });
  }

  void _onAddButton(Drink customDrink) {
    if (selectedMilk != null) {
      customDrink.addMilk([selectedMilk]);
    }

    if (_dropDownTopping != 'None') {
      customDrink.addToppings([_dropDownTopping]);
    }

    ref.read(drinksProvider.notifier).addDrink(customDrink);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    selectedMilk.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Drink customDrink = widget.drink;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drink Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Espresso Shots'),
                const SizedBox(width: 10),
                DropdownButton(
                  value: _dropDownEspresso,
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
                    _onSelectEspressoShots(newValue!, customDrink),
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Milk'),
                const SizedBox(width: 10),
                DropdownButton(
                  value: _dropDownMilk,
                  items: const [
                    DropdownMenuItem(
                      value: 'Default',
                      child: Text('Default'),
                    ),
                    DropdownMenuItem(
                      value: 'Whole Milk',
                      child: Text('Whole Milk'),
                    ),
                    DropdownMenuItem(
                      value: '2% Milk',
                      child: Text('2% Milk'),
                    ),
                    DropdownMenuItem(
                      value: 'Almond Milk',
                      child: Text('Almond Milk'),
                    ),
                    DropdownMenuItem(
                      value: 'Coconut Milk',
                      child: Text('Coconut Milk'),
                    ),
                    DropdownMenuItem(
                      value: 'Heavy Cream',
                      child: Text('Heavy Cream'),
                    ),
                    DropdownMenuItem(
                      value: 'Nonfat Milk',
                      child: Text('Nonfat Milk'),
                    ),
                    DropdownMenuItem(
                      value: 'Oat Milk',
                      child: Text('Oat Milk'),
                    ),
                    DropdownMenuItem(
                      value: 'Soy Milk',
                      child: Text('Soy Milk'),
                    ),
                  ],
                  onChanged: (String? newValue) => {
                    _onSelectMilk(newValue!),
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Toppings'),
                const SizedBox(width: 10),
                DropdownButton(
                  value: _dropDownTopping,
                  items: const [
                    DropdownMenuItem(
                      value: 'None',
                      child: Text('None'),
                    ),
                    DropdownMenuItem(
                      value: 'Caramel Drizzle',
                      child: Text('Caramel Drizzle'),
                    ),
                    DropdownMenuItem(
                      value: 'Mocha Drizzle',
                      child: Text('Mocha Drizzle'),
                    ),
                  ],
                  onChanged: (newValue) => {
                    if (newValue != null)
                      {
                        _onSelectToppings(newValue),
                      }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _onAddButton(customDrink);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
