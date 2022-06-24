
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final Database database = await openDatabase(
    join(await getDatabasesPath(), 'login_app_database'),
    onCreate: (db, version) async {
      const String createUserSql = 'CREATE TABLE USER(ID INTEGER PRIMARY KEY, `LOGIN` TEXT, `PASSWORD` TEXT)';
      try {
        Batch batch = db.batch();
        batch.execute(createUserSql);
        await batch.commit();
      } catch (exception) {
        if (kDebugMode) {
          print("Error in createDatabase function $exception");
        }
      }
    },
    version: 1,
    singleInstance: true,
  );

  return database;
}

Future<void> initDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await createDatabase();
}