import 'package:bardix/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CommonDefaultButton extends StatelessWidget {
  final ValueKey<bool> animationKey;
  final Widget? child;
  final Widget? button;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool isActive;
  final VoidCallback? onPressed;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;
  final Duration? duration;
  final Curve? curve;
  final List<BoxShadow>? boxShadow;

  const CommonDefaultButton({
    required this.animationKey,
    this.child,
    this.button,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.margin,
    this.padding,
    // required this.isActive,
    this.isActive = false,
    this.onPressed,
    this.border,
    this.alignment,
    this.duration,
    this.curve,
    this.boxShadow,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    transitionBuilder:
        (Widget child, Animation<double> animation) =>
            ScaleTransition(scale: animation, child: child),
    child: AnimatedContainer(
      key: animationKey,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16.convertPxToDp()),
      padding: padding ?? EdgeInsets.zero,
      width: width ?? double.infinity,
      height: height ?? 46.convertPxToDp(),
      alignment: alignment,
      color: backgroundColor,
      duration: duration ?? const Duration(seconds: 1),
      curve: curve ?? Curves.easeInOut,
      child:
          button ??
          ElevatedButton(
            onPressed: isActive ? onPressed : null,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(backgroundColor),
              side: WidgetStatePropertyAll(border?.top),
            ),
            child: child,
          ),
    ),
  );
}
