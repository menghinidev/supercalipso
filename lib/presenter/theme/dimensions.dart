import 'package:flutter/material.dart';

class Dimensions {
  static const tinySize = 4.0;
  static const smallSize = 8.0;
  static const mediumSize = 16.0;
  static const largeSize = 24.0;
  static const hugeSize = 48.0;

  static const pageInsetsSize = 20.0;

  static const hPageInsets = EdgeInsets.symmetric(horizontal: pageInsetsSize);
  static const pageInsets = EdgeInsets.all(pageInsetsSize);
  static EdgeInsets get pageInsetsWithBottom => hPageInsets.copyWith(bottom: pageInsetsSize);
  static EdgeInsets get pageInsetsWithTop => hPageInsets.copyWith(top: pageInsetsSize);
  static EdgeInsets get mHsTPadding => const EdgeInsets.symmetric(horizontal: mediumSize).copyWith(top: smallSize);
  static EdgeInsets get mHsBPadding => const EdgeInsets.symmetric(horizontal: mediumSize).copyWith(bottom: smallSize);
  static EdgeInsets get mHsVPadding => const EdgeInsets.symmetric(horizontal: mediumSize).copyWith(
        bottom: smallSize,
        top: smallSize,
      );
  static EdgeInsets get mVPadding => const EdgeInsets.symmetric(vertical: Dimensions.mediumSize);
  static EdgeInsets get sVPadding => const EdgeInsets.symmetric(vertical: Dimensions.smallSize);
  static EdgeInsets get allMPadding => const EdgeInsets.all(Dimensions.mediumSize);
  static EdgeInsets get allSPadding => const EdgeInsets.all(Dimensions.smallSize);
  static const lowElevation = 2.0;
}

class Shapes {
  static final lowRoundedBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.smallSize));
  static final highRoundedBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.largeSize));
  static BorderRadius get buttonBorderRadius => BorderRadius.circular(29.0);
  static BorderRadius get smallRadius => BorderRadius.circular(8.0);
  static BorderRadius get containerRadius => BorderRadius.circular(6.0);
}
