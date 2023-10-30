import 'package:flutter/material.dart';
import 'package:meals/widgets/wandas/drinks.dart';

class WandasCoffeeScreen extends StatefulWidget {
  const WandasCoffeeScreen({super.key});

  @override
  State<WandasCoffeeScreen> createState() => _WandasCoffeeScreenState();
}

class _WandasCoffeeScreenState extends State<WandasCoffeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee'),
        centerTitle: true,
      ),
      body: const Drinks(),
    );
  }
}
