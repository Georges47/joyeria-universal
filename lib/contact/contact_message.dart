import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:joyeria_universal/utils.dart';

class ContactMessage extends StatelessWidget {
  const ContactMessage({super.key});

  TextStyle _textStyle(BuildContext context) {
    return TextStyle(
      fontSize: isMobile(context) ? 18.0 : Theme.of(context).textTheme.headline6?.fontSize,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return(
      Container(
        padding: EdgeInsets.only(left: isMobile(context) ? 8.0 : 0.0, right: isMobile(context) ? 8.0 : 0.0, top: 24.0),
        width: double.infinity,
        height: 150,
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Utiliza el siguiente formulario para enviarnos un correo electrónico.${isMobile(context) ? ' ' : '\n'}También nos puedes llamar al siguiente número ',
                    style: _textStyle(context),
                  ),
                  TextSpan(
                    text: '+58 416 5611 797',
                    style: _textStyle(context).merge(const TextStyle(color: Colors.yellow)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => customLaunchUrl(Uri(scheme: 'tel', path: '+584165611797')),
                  ),
                ]
              )
            ),
          ]
        ),
      )
    );
  }
}
