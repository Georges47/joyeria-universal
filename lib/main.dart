import 'package:flutter/material.dart';
import 'package:joyeria_universal/scaffold/desktop_scaffold.dart';
import 'package:joyeria_universal/scaffold/mobile_scaffold.dart';
import 'package:joyeria_universal/utils.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joyería Universal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return isMobile(context) ? MobileScaffold() : DesktopScaffold();
  }
}
