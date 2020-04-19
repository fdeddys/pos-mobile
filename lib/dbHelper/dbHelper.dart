

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

    static DbHelper _dbHelper;
    static Database _database;

    DbHelper._createObject();

    factory DbHelper() {

        if (_dbHelper == null) {
            _dbHelper = DbHelper._createObject();
        }
        return _dbHelper;
    }

    Future<Database> initDb() async {
        Directory directory = await getApplicationDocumentsDirectory();
        String path = directory.path + '/pos.db';
        print('path database =>' + path);
        var posDb = openDatabase(path, version: 1, onCreate: _createDb);
        // _createDb(_database, 1);
        return posDb;
    }

    void _createDb(Database db, int version) async {

        print('drop create e_menu_item');
        await db.execute('''
            DROP TABLE IF EXISTS e_menu_item
            ''');
            
        await db.execute(''' 
        CREATE TABLE e_menu_item (
            id Integer primary key autoincrement,
            groupId integer,
            name text,
            "desc" text,
            imgURL text,
            price integer,
            status integer,
            stock integer,
            restoId integer
        )
        ''');
        print('created e_menu_item'); 
        
        
        print('drop create e_menu_item');        
        await db.execute('DROP TABLE IF EXISTS e_menu_group');
        await db.execute(''' 

        CREATE TABLE  e_menu_group (
            id Integer primary key autoincrement,
            resto_id integer,
            "name" text,
            img_url text,
            status integer,
            jam_buka text
        )
        ''');
        print('created e_menu_group'); 

    }

    Future<Database> get database async {
        print('get database');
        if (_database == null) {
            print('try init database');
            _database = await initDb();
        }
        return _database;
    }

    // Future<List<Map<String, dynamic>>> selectMenuGroup () async {

    //     print('db select');

    //     Database db = await this.database;
    //     var mapList = await db.query('e_menu_group');
    //     return mapList;
    // }

}