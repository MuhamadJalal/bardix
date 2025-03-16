import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  void goto(BuildContext context, previousRoute, {Object? extra}) =>
      context.canPop()
          ? context.pop()
          : context.go(previousRoute!, extra: extra); // Fallback to previousRoute
}
