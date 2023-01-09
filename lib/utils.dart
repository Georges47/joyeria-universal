import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

bool isMobile(BuildContext context) {
  return screenWidth(context) < 800;
}

Future<void> customLaunchUrl(url) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}

double appBarHeight() {
  return AppBar().preferredSize.height;
}
