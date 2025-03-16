import 'package:flutter/material.dart';

class AnimatedProgressWidget extends StatelessWidget {
  final double factor;

  const AnimatedProgressWidget({super.key, required this.factor});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 16),
    height: 5,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(5),
    ),
    child: FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: factor, // Progress completion percentage
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
}
