
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/lista_contatos.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';
import 'models/contact.dart';

void main() {
  runApp(BytebankApp());
  save(Contact(1, 'alex', 1000)).then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}
class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green.shade900,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green.shade900,
          secondary: Colors.blueAccent.shade700,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Colors.blueAccent.shade700),
          ),
        ),
      ),
      home: Dashboard(),
    );
  }
}