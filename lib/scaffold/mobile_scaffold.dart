import 'package:flutter/material.dart';
import 'package:joyeria_universal/content.dart';
import 'package:joyeria_universal/drawer/drawer_sections.dart';
import 'package:joyeria_universal/drawer/left_drawer.dart';
import 'package:joyeria_universal/utils.dart';

class MobileScaffold extends StatelessWidget {
  MobileScaffold({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: LeftDrawer(
        sections: sections(_scrollController, screenHeight(context) - appBarHeight()),
      ),
      body: Content(scrollController: _scrollController,),
    );
  }
}
