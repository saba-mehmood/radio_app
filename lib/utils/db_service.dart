import 'package:flutter/material.dart';
import 'package:radio_app/models/db_model.dart';
import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

abstract class DB{
  static Database _db;
//database version
  static int get _version => 1;

  static Future<void> init() async{
    if (_db != null){
      return;
    }

    try{
      //getting path of database
      var databasePath = await getDatabasesPath();
      //joining database path with my application
      String _path = p.join(databasePath, 'RadioApp.db');
      //opening data
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch(ex){
      print(ex);
    }
  }

  //in this method we are executing out tables
  static void onCreate(Database db, int version) async{
 await db.execute(
   'CREATE TABLE radios(id INTEGER PRIMARY KEY NOT NULL, radioName STRING, radioURL STRING, radioDesc STRING, radioWebsite STRING, radioPic String)'
 );
 await db.execute(
   'CREATE TABLE radios_bookmarks(id INTEGER PRIMARY KEY NOT NULL, isFavourate INTEGER)'
 );
  }

  //method for passing table in query
  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, DBBaseModel model) async =>
      await _db.insert(table, model.toMap());
}
