import 'package:flutter/material.dart';
import 'package:sqf_demo_project/model/my_model.dart';
import 'package:sqflite/sqflite.dart';

class HomePageController {
  static late Database mydatabase;

  static List dbdataList = [];
  List<MyModel> myModelList = [];

  // function for init database
  static Future initDb() async {
    mydatabase = await openDatabase(
      "empoyee.db",
      version: 1,
      onCreate: (Database db, int version) {
        db.execute(
            "CREATE TABLE employee(id INTEGER PRIMARY KEY, name TEXT, position TEXT)");
      },
    );
  }

// function for add data
  static Future<void> addDatatoDb({required String name}) async {
    await mydatabase.rawInsert(
        'INSERT INTO Employee (name,position) VALUES (?,?)',
        [name, "R&D ENGINEER"]);
  }

// function for get data
  Future<void> getAllDataFromDb() async {
    dbdataList = await mydatabase.rawQuery("SELECT * FROM Employee");

    //to convert data from db t model class

    myModelList = dbdataList.map((element) {
      return MyModel(
          id: element["id"],
          name: element["name"],
          designation: element["position"]);
    }).toList();
  }
}
