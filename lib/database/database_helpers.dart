import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// database table and column names
const String tableUser = 'users';
const String columnId = '_id';
const String columnName = 'username';
const String columnLevel = 'user_level';
const String columnProgressToNextLevel = 'progress_to_next_level';

// data model class
class User {
  late int id;
  late String name;
  late int level;
  late int progressTowardsNextLevel;

  User();

  // convenience constructor to create a Word object
  User.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    level = map[columnLevel];
    progressTowardsNextLevel = map[columnProgressToNextLevel];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnLevel: level,
      columnProgressToNextLevel: progressTowardsNextLevel,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

class Task {
  late int id;
  late String taskType;
  late int correctAnswers;
}

class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static const _databaseName = "gamificacion.db";
  // Increment this version when you need to change the schema.
  static const _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static late Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableUser (
                $columnId INTEGER PRIMARY KEY,
                $columnName TEXT NOT NULL,
                $columnLevel INTEGER NOT NULL,
                $columnProgressToNextLevel INTEGER NOT NULL
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(User word) async {
    Database db = await database;
    int id = await db.insert(tableUser, word.toMap());
    return id;
  }

  Future<User> queryUser(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableUser,
        columns: [
          columnId,
          columnName,
          columnLevel,
          columnProgressToNextLevel,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    }
    return User();
  }

  // TODO: queryAllWords()
  // TODO: delete(int id)
  // TODO: update(Word word)
}
