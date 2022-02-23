import 'package:bytebank/database/DAO/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/* utilizando uma sintax sugar para não preicsar trabalhar com muitos callbacks .
Diferença do código comentado para o ativo é a comparação de async await e  then future
 mostrando assim que o método async await é melhor e mais organizado de ser usado */

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
    //    onDowngrade: onDatabaseDowngradeDelete,
  );
}
  /* onDowngrade comentado pois pode causar problemas futuros. Utilizar só se precisar
     dar reboot no banco de dados/cleanar as informações adicionadas.Para utilizar basta
      mudar a versão do data base e depois dar HOT RESTART para resetar os dados do banco.*/


// código antigo do getdatabase, que a db execute se encontra no ContactDao.tableSql
// return getDatabasesPath().then((dbPath){
//   final String path = join(dbPath,'bytebank01.db');
//   return openDatabase(path, onCreate: (db, version) {
//     db.execute('CREATE TABLE contacts('
//     'uid INTEGER PRIMARY KEY, '
//           'name TEXT, '
//           'account_number INTEGER)');
//
//    },version: 1,
//   //onDowngrade: onDatabaseDowngradeDelete,
//   );
//  });
//}



