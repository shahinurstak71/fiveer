
import 'package:fiveer/models/contact.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class  DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper()=> _instance;

  final String dbName = 'contactDB.db';
  final String tableContact = 'contactTale';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnPhone = 'phone';
  final String columnEmail = 'email';
  final String columnAddress = 'address';
  final String columnDescription = 'description';
  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }
  initDb()async{
    String databasePath = await getDatabasesPath();
    String path = join (databasePath, dbName);
    var db = await openDatabase(path,version:1,onCreate: _onCreate);
    return db;

  }
  void _onCreate(Database db , int newVersion)async{
    await db.execute("create table $tableContact("'$columnId integer primary key autoincrement,'
        '$columnName text,'
        '$columnPhone text,'
        '$columnEmail text,'
        '$columnAddress text,'
        '$columnDescription text,'
        ")");
    

  }

  Future <int>create (Contact contact) async{
    var dbClient = await db;
    var result = await dbClient.insert(tableContact, contact.toJson());
    return result;
  }


  
  Future<List> findAll() async{
    var dbClient = await db;
    var result =await dbClient.query(tableContact,columns: [
      columnId,  columnName,  columnPhone,  columnEmail, columnAddress,
      columnDescription
    ]);
    return result.toList();

  }

  Future <int> delete(int id)async{
    var dbClient = await db;
    return await dbClient.delete(tableContact, where: '$columnId = ?',whereArgs:[id] );

  }


  Future <int>update (Contact contact) async{
    var dbClient = await db;
    var result = await dbClient.update(tableContact, contact.toJson(),where:  '$columnId = ?',whereArgs: [contact.id]);

    return result;
  }


}