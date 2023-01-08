import 'package:flutter/material.dart';
import 'package:joyeria_universal/utils.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return(
      Container(
        color: Colors.white,
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("© 2023 Joyería Universal"),
            const SizedBox(height: 18.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.black),
                  ),
                  onPressed: () {},
                  child: const Text("Aviso legal"),
                ),
                if (!isMobile(context)) const SizedBox(width: 24.0,),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.black),
                  ),
                  onPressed: () {},
                  child: const Text("Política de privacidad"),
                ),
              ],
            )
          ],
        ),
        )
    );
  }
}
