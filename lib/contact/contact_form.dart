import 'package:flutter/material.dart';
import 'package:joyeria_universal/utils.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<StatefulWidget> createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final double verticalFieldSpace = 24.0;
  final double horizontalFieldSpace = 24.0;

  Widget _textFormField(String label) {
    return (
      Expanded(
        child: TextFormField(
          decoration: InputDecoration(
            labelStyle: Theme.of(context).textTheme.bodyText1?.merge(const TextStyle(color: Colors.grey, fontWeight: FontWeight.w100)),
            label: Text(label),
            border: const OutlineInputBorder(),
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return (
      SizedBox(
        width: isMobile(context) ? screenWidth(context) / 1.25 : screenWidth(context) / 2.25,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _textFormField('Nombre*'),
                  SizedBox(width: horizontalFieldSpace),
                  _textFormField('Apellido*'),
                ],
              ),
              SizedBox(height: verticalFieldSpace),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _textFormField('Correo*'),
                  SizedBox(width: horizontalFieldSpace),
                  _textFormField('Teléfono'),
                ],
              ),
              SizedBox(height: verticalFieldSpace),
              TextFormField(
                decoration: InputDecoration(
                  label: const Text('¿Qué podemos hacer por ti?'),
                  labelStyle: Theme.of(context).textTheme.bodyText1?.merge(const TextStyle(color: Colors.grey, fontWeight: FontWeight.w100)),
                  alignLabelWithHint: true,
                  border: const OutlineInputBorder(),
                ),
                minLines: 3,
                maxLines: 3,
              ),
              SizedBox(height: verticalFieldSpace),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  textStyle: Theme.of(context).textTheme.bodyText1
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enviando...')),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          )
        ),
      )
    );
  }
}
