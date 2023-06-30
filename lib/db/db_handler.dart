// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io' as io;
//
// class DBHelper {
//   static Database? _db ;
//
//   Future<Database?> get db async{
//     if(_db != null){
//       return _db ;
//     }
//     _db = await initDatabase();
//     return _db ;
//   }
//
//   initDatabase() async{
//     io.Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, 'todo.db');
//     var db = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return db;
//   }
//
//   _onCreate(Database db, int version) async {
//     await db.execute('CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, todoText TEXT NOT NULL, isDone BOOLEAN NOT NULL)')
//   }
//
//   Future<TodoModel> insert(TodoModel todoModel) async {
//
//     var dbClient = await db;
//     await dbClient!.insert('todo', todoModel.toMap());
//
//     return todoModel;
//   }
//
// }