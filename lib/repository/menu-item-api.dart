import 'dart:convert';

import 'package:pos_cahier/model/menu-item.dart';
import 'package:pos_cahier/share/globals.dart' as globals;
import 'package:http/http.dart' as http;


class MenuItemApiClient  {
    String serverPath = globals.serverPath;

    Future<List<MenuItem>> getAllMenuItem(String restoCode) async {

        List<MenuItem> menuItems = [];
        String apiUrl = serverPath + '/menu-item/filter';
        Map data = {
            'restoCode' : restoCode
        };

        var bodyJson = jsonEncode(data);
        var apiResult =await http.post(apiUrl, body:  bodyJson);
        var jsonObj = json.decode(apiResult.body);

         if (jsonObj['rc']=='00'){
            if (jsonObj['data'] != []) {
                menuItems = ( jsonObj['data'] as List ).map((i)=> MenuItem.fromJson(i)).toList();
            }
            return menuItems;
        }
        return menuItems;
        // throw new Exception('Error ' + jsonObj['message']); 
    }
}