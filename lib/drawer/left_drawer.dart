import 'package:flutter/material.dart';
import 'package:joyeria_universal/drawer/drawer_icons.dart';

class LeftDrawer extends StatelessWidget {
  final List<ListTile> sections;

  const LeftDrawer({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return(
      Drawer(
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                // color: Colors.blue,
              ),
              child: Center(
                  child: Text('Joyería Universal')
              ),
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
