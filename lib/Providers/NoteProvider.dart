import 'package:path/path.dart';
import 'package:list_app/Helpers/StringHelpers.dart';
import 'package:sqflite/sqflite.dart';

class NoteProvider {
  static Database database;

  static String idIndex = 'id = ?';

  static Future open() async {
    database = await openDatabase(
        join(await getDatabasesPath(), StringHelpers.databaseFileName),
        version: 1, onCreate: (Database database, int version) async {
      await database.execute('''
        CREATE TABLE Notes(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          Title TEXT NOT NULL,
          Description TEXT NOT NULL
        );
      ''');
      print('created database');
    });
  }

  static Future<List<Map<String, dynamic>>> getNotesList() async {
    bool databaseDoesNotExist = (database == null);
    if (databaseDoesNotExist) {
      await open();
    }
    return await database.query(StringHelpers.databaseTableName);
  }

  static Future insertNote(Map<String, dynamic> note) async {
    print('insert note into database');
    await database.insert(StringHelpers.databaseTableName, note);
  }

  static Future updateNote(Map<String, dynamic> note) async {
    print('update note from database');
    await database.update(StringHelpers.databaseTableName, note,
        where: idIndex, whereArgs: [note[StringHelpers.databaseID]]);
  }

  static Future deleteNote(int id) async {
    print('delete note from database');
    await database.delete(StringHelpers.databaseTableName,
        where: idIndex, whereArgs: [id]);
  }
}
