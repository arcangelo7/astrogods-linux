import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../l10n/app_localizations.dart';
import '../models/birth_chart.dart';

class DateUtils {
  static String formatBirthDateTime(
    BuildContext context,
    BirthChart birthChart,
  ) {
    final locale = Localizations.localeOf(context).languageCode;
    final dateFormatter = DateFormat('d MMMM y', locale);
    final timeFormatter = DateFormat('HH:mm', locale);

    String formattedDate = dateFormatter.format(birthChart.date);
    String result = formattedDate;

    if (!birthChart.unknownTime) {
      result +=
          ' ${AppLocalizations.of(context)!.at} ${timeFormatter.format(birthChart.date)}';
    }

    return result;
  }

  static String formatDate(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).languageCode;
    final dateFormatter = DateFormat('d MMMM y', locale);
    return dateFormatter.format(date);
  }

  static String formatTime(BuildContext context, DateTime dateTime) {
    final locale = Localizations.localeOf(context).languageCode;
    final timeFormatter = DateFormat('HH:mm', locale);
    return timeFormatter.format(dateTime);
  }

  static String formatMonthYear(BuildContext context, int month, int year) {
    final locale = Localizations.localeOf(context).languageCode;
    final date = DateTime(year, month);
    final formatter = DateFormat('MMMM y', locale);
    return formatter.format(date);
  }
}
