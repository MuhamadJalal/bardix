import 'package:bardix/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final List<double>? stops;
  final Color? startColor;
  final Color? endColor;
  final BorderRadius? borderRadius;

  const GradientContainer({
    super.key,
    required this.child,
    this.stops,
    this.startColor,
    this.endColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(top: 60.convertPxToDp()),
    decoration: BoxDecoration(
      borderRadius: borderRadius,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: stops ?? const [0.1, 0.3],
        colors: [
          startColor ??
              Theme.of(context).badgeTheme.backgroundColor!, // Start Color
          endColor ?? Theme.of(context).scaffoldBackgroundColor, // End Color
        ],
      ),
    ),
    child: child,
  );
}
