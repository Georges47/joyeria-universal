import 'package:flutter/material.dart';
import 'package:joyeria_universal/drawer/drawer_icons.dart';

class LeftDrawer extends StatelessWidget {
  final List<ListTile> sections;

  const LeftDrawer({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return(
      Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo_name.png'),
                ),
              ),
              child: Container(),
            ),
            ...sections,
            const Spacer(),
            const DrawerIcons(),
          ],
        ),
      )
    );
  }
}
