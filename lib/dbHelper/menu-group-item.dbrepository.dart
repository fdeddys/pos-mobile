

import 'package:pos_cahier/dbHelper/dbHelper.dart';
import 'package:pos_cahier/model/menu-group.dart';
import 'package:sqflite/sqlite_api.dart';

class MenuGroupItemRepository {
    DbHelper dbHelper = new DbHelper();

    Future<int> insert (MenuGroup menuGroup) async {
        final Database db = await dbHelper.initDb();

        return await db.insert("e_menu_group", menuGroup.toMap());

    }

    Future<List<MenuGroup>> getAll() async {

        final Database db = await dbHelper.initDb();
        final List<Map<String, dynamic>> maps = await db.query("e_menu_group");
        final List<MenuGroup> menuGroups =List() ;

        for (var menuGroup in maps) {
            MenuGroup menuGrp = MenuGroup.fromJson(menuGroup);
            menuGroups.add(menuGrp);
        }

        return menuGroups;

    }

}