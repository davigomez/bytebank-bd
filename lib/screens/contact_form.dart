import 'package:bytebank/database/DAO/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome Completo'),
              style: const TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: const InputDecoration(labelText: 'Número Da Conta'),
                style: const TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('Criar'),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int? accountNumber =
                        int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(0, name, accountNumber!);
                    _dao.save(newContact).then((id) => Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
