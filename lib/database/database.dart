import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/notifications/notification_service.dart';

import '../models/task_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
    static Database? _database;




  Future<Database> get database async => _database ??= await _initDatabase();
    Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

   Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
         title TEXT,
          description TEXT,
          time TEXT
      )
      ''');
  }
    Future<List<task>> gettasks() async {
    Database db = await instance.database;
    var tasks = await db.query('tasks', orderBy: 'id');
    List<task> taskList = tasks.isNotEmpty
        ? tasks.map((c) => task.fromMap(c)).toList()
        : [];
    return taskList.reversed.toList();
  }




   Future<int> add(task task) async {
    Database db = await instance.database;
    return await db.insert('tasks', task.toMap());
  }

   Future<int> remove(int id) async {
    Database db = await instance.database;
  await NotificationService().delete_notification(id);
  await NotificationService().delete_notification(id+1000);
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

    Future<int> update(task task) async {
    Database db = await instance.database;
    return await db.update('tasks', task.toMap(),
        where: "id = ?", whereArgs: [task.id]);
  }

  Future<List<task>> search(String data)async{
Database db = await instance.database;
var tasks = await db.query('tasks',where: "title LIKE ?",whereArgs: ["%${data}%"]);
   List<task> taskList = tasks.isNotEmpty
        ? tasks.map((c) => task.fromMap(c)).toList()
        : [];
    return taskList;


  }
}

 
