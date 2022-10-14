import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercalipso/presenter/theme/colors.dart';

class ThemeBuilder {
  static ThemeData buildTheme(BuildContext context) => ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0.0,
          unselectedLabelStyle: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme).bodyText2,
          selectedLabelStyle: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme).bodyText1,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          titleTextStyle: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black),
        ),
      );
}
