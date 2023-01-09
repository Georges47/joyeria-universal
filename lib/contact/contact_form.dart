import 'package:flutter/material.dart';
import 'package:joyeria_universal/utils.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<StatefulWidget> createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  Widget _textFormField(String label) {
    return (
      Expanded(
        child: TextFormField(
          decoration: InputDecoration(
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
        width: isMobile(context) ? screenWidth(context) / 1.25 : screenWidth(context) / 2.5,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _textFormField('Nombre*'),
                  const SizedBox(width: 24.0),
                  _textFormField('Apellido*'),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _textFormField('Correo*'),
                  const SizedBox(width: 24.0),
                  _textFormField('Teléfono'),
                ],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('¿Qué podemos hacer por ti?'),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                minLines: 3,
                maxLines: 3,
              ),
              const SizedBox(height: 16.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                  )
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
