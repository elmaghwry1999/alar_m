import 'package:alarm/model/alarm_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataSource {
  // private variable is const {database,name database , version database, table name}
  static Database? database;
  static const String _dbName = "alarm.db";
  static const int _dbVersion = 1;
  static const String _tableName = "alarm";

// create database and table
  void createDb() async {
    String path = await getDatabasesPath();
    String newPath = join(path, _dbName);

    database = await openDatabase(
      newPath,
      version: _dbVersion,
      onOpen: (database) => print('teble created'),
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        //alarmTime,timeNow,alarmDate,dateNow,isActive
        await db.execute(
            'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY,alarmTime TEXT ,timeNow TEXT ,alarmDate TEXT ,dateNow TEXT , isActive TEXT )');
        print('created tables');
      },
    );
  }


//alarmTime,timeNow,alarmDate,dateNow,isActive
  addAlarm(AlarmModel alarmModel) async {
  await  database!.transaction((txn) => txn.rawInsert('INSERT INTO $_tableName(alarmTime, timeNow, alarmDate,dateNow,isActive) VALUES("${alarmModel.alarmTime}", "${alarmModel.timeNow}", "${alarmModel.alarmDate}","${alarmModel.dateNow}","true")').then((value) {print('inserted row mokh : $value');}).catchError((error){
      print('error when inserted row :===> $error');
    }));
  }

// Delete Note
//   Future<int> deleteAlarm(AlarmModel alarm) async {
//     Database db = await instance.checkDatabase;
//     return await db.delete(
//       _tableName,
//       where: "id = ?",
//       whereArgs: [alarm.id],
//     );
//   }
//
//
// // TODO: get all notes
  getAlarmList() async {

    await database!.rawQuery('SELECT * FROM $_tableName');

  }
//
//
//   Future<List<AlarmModel>> getAlarmWithId(AlarmModel note) async {
//     Database db = await instance.checkDatabase;
//     note.toMap();
//     final List<Map<String, dynamic>> map = await db.query(_tableName, where: "id = ?",
//       whereArgs: [note.id], );
//
//     return List.generate(
//       map.length,
//           (index) {
//         return AlarmModel(
//           id: map[index]["id"],
//           isActive: map[index]["isActive"],
//           alarmDateTime: map[index]["alarmDateTime"],
//         );
//       },
//     );
//   }
}
