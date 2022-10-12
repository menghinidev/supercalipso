import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatterLocalizationDelegate extends LocalizationsDelegate {
  static final DateFormatterLocalizationDelegate _singleton = DateFormatterLocalizationDelegate._();
  static DateFormatterLocalizationDelegate get instance => _singleton;

  DateFormatterLocalizationDelegate._();

  final dateFormattingSupportedLocale = const [Locale('it', 'IT'), Locale('en', 'US')];

  @override
  bool isSupported(Locale locale) {
    var languages = dateFormattingSupportedLocale.map((e) => e.languageCode);
    return languages.contains(locale.languageCode);
  }

  @override
  Future load(Locale locale) async {
    Intl.systemLocale = locale.languageCode;
    return Future.value();
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}
