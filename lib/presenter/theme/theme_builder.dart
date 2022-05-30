import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercalipso/presenter/theme/colors.dart';

class ThemeBuilder {
  static ThemeData buildTheme(BuildContext context) => ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
      );
}
