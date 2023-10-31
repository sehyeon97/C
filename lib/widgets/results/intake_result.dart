import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  const ResultText({
    super.key,
    required this.result,
    required this.unit,
  });

  final String result;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$result $unit',
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
