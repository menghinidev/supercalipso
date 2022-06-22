import 'package:flutter/material.dart';

class Dimensions {
  static const tinySize = 4.0;
  static const smallSize = 8.0;
  static const mediumSize = 16.0;
  static const largeSize = 24.0;
  static const hugeSize = 48.0;

  static const pageInsetsSize = 20.0;

  static const pageInsets = EdgeInsets.symmetric(horizontal: pageInsetsSize);

  static const lowElevation = 2.0;
}

class Shapes {
  static final lowRounded = RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.smallSize));
  static final highRounded = RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.largeSize));
}
