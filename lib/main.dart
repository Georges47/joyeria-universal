import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:joyeria_universal/content.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setPathUrlStrategy();
  initializeDateFormatting('es', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joyería Universal',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: const Content(),
    );
  }
}
