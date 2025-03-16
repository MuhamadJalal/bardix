import 'package:flutter/material.dart';

class SizeUtils {
  static late double devicePixelRatio;

  static void init(BuildContext context) {
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  }
}

extension SizeConverterPxDp on num {
  /// [convertPxToDp] convert pixels to Dp
  /// Formula [dp = px / devicePixelRatio]
  ///
  ///
  /// ex: width: 45.convertPxToDp(),
  ///
  /// that means the fontSize will space a 4.5% of the device's screen width
  ///
  double convertPxToDp() {
    double designDensityMultiplier = 3.0;
    // double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return (this / SizeUtils.devicePixelRatio) * designDensityMultiplier;
  }
}
