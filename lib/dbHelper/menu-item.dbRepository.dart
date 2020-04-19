

import 'package:pos_cahier/dbHelper/dbHelper.dart';
import 'package:pos_cahier/model/menu-item.dart';
import 'package:sqflite/sqlite_api.dart';

class MenuItemDbRepository {

    DbHelper dbHelper = new DbHelper();

    Future<int> insert(MenuItem menuItem) async {
        final Database db = await dbHelper.initDb();
        return await db.insert(
            "e_menu_item", 
            menuItem.toMap(), 
            conflictAlgorithm: ConflictAlgorithm.replace
        );
    }

    Future<List<MenuItem>> getAllMenuItem() async {

        final Database db = await dbHelper.initDb();
        final List<Map<String, dynamic>> maps = await db.query('e_menu_item');
        final List<MenuItem> menuItems = List();

        for (final menuItm in maps) {
            MenuItem menuItem = MenuItem.fromJson(menuItm);
            menuItems.add(menuItem);
        }

        return menuItems;
    }

}