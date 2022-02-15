import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase(){
  return getDatabasesPath().then((dbPath){
    final String path = join(dbPath,'bytebank01.db');
    return openDatabase(path, onCreate: (db, version) {
      onDowngrade: onDatabaseDowngradeDelete;
      db.execute('CREATE TABLE contatos('
      'uid INTEGER PRIMARY KEY, '
            'name TEXT, '
            'account_number INTEGER)');

     },version: 1);
   });
  }

  Future<int> save(Contact contact){
  return createDatabase().then((db){
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contatos',contactMap);
    });
  }

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['uid'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}