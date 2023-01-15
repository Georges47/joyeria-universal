import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

List<String> weekDays() {
  return DateFormat.EEEE('es').dateSymbols.STANDALONEWEEKDAYS
      .map((day) => '${day[0].toUpperCase()}${day.substring(1)}')
      .toList();
}

bool isToday(String weekDay) {
  return DateFormat.EEEE('es').format(DateTime.now()) == weekDay.toLowerCase();
}