import 'package:flutter/material.dart';

class BuildCardSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const BuildCardSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) => Card(
    elevation: 3,
    margin: const EdgeInsets.only(bottom: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    ),
  );
}
