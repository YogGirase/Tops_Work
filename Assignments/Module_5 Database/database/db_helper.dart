import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/student.dart';

class DbHelper {
  static const DB_VERSION = 1;

  // database name
  static const DB_NAME = "topstech.db";

  // table name
  static const TBL_STUDENT = "students";

  // column name
  static const COL_ID = 'id';
  static const COL_FNAME = 'firstName';
  static const COL_LNAME = 'lastName';
  static const COL_EMAIL = 'email';
  static const COL_CONTACT = 'contact';
  static const COL_GENDER = 'gender';
  static const COL_COURSE = 'course';
  static const COL_PASSWORD = 'password';
  static const COL_TIMESTAMP = 'createdAt';

  static DbHelper? _instance;
  static Database? _db;

  factory DbHelper() {
    return _instance ?? DbHelper._internal();
  }

  Future<Database> getDatabase() async {
    return _db ?? await createDatabase();
  }

  DbHelper._internal();

  Future<Database> createDatabase() async {
    // openDatabase();

    var path = await getDatabasesPath();
    print('path : $path');
    var dbPath = join(path, DB_NAME);
    print('database path : $dbPath');

    return await openDatabase(
      dbPath,
      version: DB_VERSION,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE $TBL_STUDENT ('
            '$COL_ID INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$COL_FNAME TEXT NOT NULL,'
            '$COL_LNAME TEXT NOT NULL,'
            '$COL_EMAIL TEXT NOT NULL,'
            '$COL_CONTACT TEXT NOT NULL,'
            '$COL_GENDER TEXT NOT NULL,'
            '$COL_COURSE TEXT NOT NULL,'
            '$COL_PASSWORD TEXT NOT NULL,'
            '$COL_TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP)');
      },
    );
  }

  Future<void> insertRecord(
      {required Student student,
      required Function(int) onSuccess,
      required Function(String) onError}) async {
    int rows = -1;

    try {
      var db = await getDatabase();

      rows = await db.insert(TBL_STUDENT, student.toMap(),
          conflictAlgorithm:
              ConflictAlgorithm.replace); // return new inserted row primary key

      onSuccess(rows);
    } catch (e) {
      onError('Error : ${e.toString()}');
    }
  }

  Future<List<Student>> getStudentList() async {
    var db = await getDatabase();
    List<Map<String, Object?>> data = await db.query(TBL_STUDENT);
    return data.map((map) => Student.fromMap(map)).toList();
  }

  Future<int> deleteStudent(int id) async {
    var db = await getDatabase();
    return await db.delete(TBL_STUDENT,
        where: '$COL_ID = ?',
        whereArgs: [id]); // return numbers of rows affected
  }

  Future<bool> updateRecord(Student student) async {
    bool result = false;

    var db = await getDatabase();

    try {
      await db.update(TBL_STUDENT, student.toMap(),
          where: '$COL_ID = ?', whereArgs: [student.id]);
      result = true;
    } catch (e) {}

    return result;
  }
}
