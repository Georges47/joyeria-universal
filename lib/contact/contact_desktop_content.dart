import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactDesktopContent extends StatelessWidget {
  const ContactDesktopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Text("Joyería Universal", style: TextStyle(fontSize: 48.0),),
              const Spacer(),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(72.0),
                1: IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: const [
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          size: 36.0
                        ),
                      ),
                    ),
                    TableCell(
                      child: SelectableText(
                        '+58 416-5611797',
                        style: TextStyle(fontSize: 24.0),
                      )
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    SizedBox(height: 24.0),
                    SizedBox(height: 24.0),
                  ]
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.instagram,
                          size: 36.0,
                        ),
                      ),
                    ),
                    TableCell(
                      child: SelectableText(
                        '@joyeriauniversalmcbo',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    SizedBox(height: 24.0),
                    SizedBox(height: 24.0),
                  ]
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Icon(
                        Icons.mail_outline,
                        size: 36.0
                      ),
                    ),
                    TableCell(
                      child: SelectableText(
                        'joyeríauniversal@outlook.com',
                        style: TextStyle(fontSize: 24.0))
                    ),
                  ]
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
