import 'package:flutter/material.dart';

List<ListTile> sections(ScrollController scrollController, double screenHeight) {
  return [
    ListTile(
      title: const Text('Inicio'),
      onTap: () {
        scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease
        );
      },
    ),
    ListTile(
      title: const Text('Contacto'),
      onTap: () {
        scrollController.animateTo(
          screenHeight,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease
        );
      }
    ),
    ListTile(
      title: const Text('Ubicación'),
      onTap: () {
        scrollController.animateTo(
          screenHeight * 2,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease
        );
      }
    ),
  ];
}
