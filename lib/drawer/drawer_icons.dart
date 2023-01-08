import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joyeria_universal/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerIcons extends StatelessWidget {
  const DrawerIcons({super.key});

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.instagram),
              iconSize: 32.0,
              onPressed: () {
                _launchUrl(Uri.parse('https://www.instagram.com/joyeriauniversalmcbo/'));
              },
            ),
            if(isMobile(context))
              IconButton(
                icon: const Icon(Icons.whatsapp),
                iconSize: 32.0,
                onPressed: () {
                  _launchUrl(Uri(scheme: 'https', path: 'wa.me/584165611797')); // Mobile
                },
              ),
            IconButton(
              icon: const Icon(Icons.mail_outline),
              iconSize: 32.0,
              onPressed: () {
                _launchUrl(Uri(scheme: 'mailto', path: 'joyeríauniversal@outlook.com'));
              },
            ),
            if(isMobile(context))
              IconButton(
                icon: const Icon(Icons.phone_outlined),
                iconSize: 32.0,
                onPressed: () {
                  _launchUrl(Uri(scheme: 'tel', path: '+584165611797'));
                },
              ),
          ],
        ),
      )
    );
  }
}
