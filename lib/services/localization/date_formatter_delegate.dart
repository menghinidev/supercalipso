import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatterLocalizationDelegate extends LocalizationsDelegate {
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

mixin DateFormatter {
  String formatDate(DateTime datetime) => DateFormat.yMd().format(datetime);
  String formatTime(DateTime datetime) => DateFormat.Hm().format(datetime);
  String formatDateAndTime(DateTime datetime) => DateFormat.MMMd().add_Hm().format(datetime);
}
