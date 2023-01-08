import 'package:flutter/material.dart';
import 'package:joyeria_universal/content.dart';
import 'package:joyeria_universal/drawer/drawer_sections.dart';
import 'package:joyeria_universal/drawer/left_drawer.dart';
import 'package:joyeria_universal/utils.dart';

class DesktopScaffold extends StatelessWidget {
  DesktopScaffold({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LeftDrawer(
            sections: sections(_scrollController, screenHeight(context)),
          ),
          Expanded(
            child: Content(scrollController: _scrollController,),
          )
        ],
      ),
    );
  }
}
