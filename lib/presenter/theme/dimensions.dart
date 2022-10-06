import 'package:flutter/material.dart';

class Dimensions {
  static const tinySize = 4.0;
  static const smallSize = 8.0;
  static const mediumSize = 16.0;
  static const largeSize = 24.0;
  static const hugeSize = 48.0;

  static const pageInsetsSize = 20.0;

  static const pageInsets = EdgeInsets.symmetric(horizontal: pageInsetsSize);
  static EdgeInsets get pageInsetsWithTop => pageInsets.copyWith(top: pageInsetsSize);
  static EdgeInsets get mHsTPadding => const EdgeInsets.symmetric(horizontal: mediumSize).copyWith(top: smallSize);
  static EdgeInsets get mHsBPadding => const EdgeInsets.symmetric(horizontal: mediumSize).copyWith(bottom: smallSize);
  static EdgeInsets get mVPadding => const EdgeInsets.symmetric(vertical: Dimensions.mediumSize);
  static EdgeInsets get allMPadding => const EdgeInsets.all(Dimensions.mediumSize);
  static const lowElevation = 2.0;
}

class Shapes {
  static final lowRounded = RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.smallSize));
  static final highRounded = RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.largeSize));
}
