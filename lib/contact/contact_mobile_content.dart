import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joyeria_universal/utils.dart';

class ContactMobileContent extends StatelessWidget {
  const ContactMobileContent({super.key});

  double _dividerHeight(double screenHeight) {
    if (screenHeight > 950) {
      return 64.0;
    } else if (screenHeight > 650) {
      return 0.1290 * screenHeight - 58.5806;
    } else {
      return 24.0;
    }
  }

  double _logoSide(double screenHeight) {
    if (screenHeight > 750) {
      return 150;
    } else if (screenHeight > 650) {
      return 0.5 * screenHeight - 225;
    } else {
      return 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: _logoSide(screenHeight(context)),
              width: _logoSide(screenHeight(context)),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0,),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    customLaunchUrl(Uri(scheme: 'https', path: 'wa.me/584165611797'));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Center(
                        child: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          size: 36.0
                        ),
                      ),
                      SizedBox(height: 4.0,),
                      SelectableText(
                        '+58 416-5611797',
                        style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Divider(height: _dividerHeight(screenHeight(context)),),
                InkWell(
                  onTap: () {
                    customLaunchUrl(Uri.parse('https://www.instagram.com/joyeriauniversalmcbo/'));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Center(
                        child: FaIcon(
                          FontAwesomeIcons.instagram,
                          size: 36.0
                        ),
                      ),
                      SelectableText(
                        '@joyeriauniversalmcbo',
                        style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Divider(height: _dividerHeight(screenHeight(context)),),
                InkWell(
                  onTap: () {
                    customLaunchUrl(Uri(scheme: 'mailto', path: 'joyeríauniversal@outlook.com'));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Center(
                        child: Icon(
                          Icons.mail_outline,
                          size: 36.0
                        ),
                      ),
                      SelectableText(
                        'joyeríauniversal@outlook.com',
                        style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}