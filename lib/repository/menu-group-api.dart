import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pos_cahier/model/menu-group.dart';

import 'package:pos_cahier/share/globals.dart' as globals;

class MenuGroupApiClient  {
    String serverPath = globals.serverPath;

    Future<List<MenuGroup>> getAllMenuGroup(int restoID) async {

        List<MenuGroup> menuGroups;

        String apiUrl = serverPath + '/menu-group/resto/$restoID';

         var apiResult =await http.get(
            apiUrl,
        );

        var jsonObj = json.decode(apiResult.body);

         if (jsonObj['rc']=='00'){
            if (jsonObj['data'] != []) {
                menuGroups = ( jsonObj['data'] as List ).map((i)=> MenuGroup.fromJson(i)).toList();
            }
            return menuGroups;
        }
        throw new Exception('Error ' + jsonObj['message']); 

    }
}