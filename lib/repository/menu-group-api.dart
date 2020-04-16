import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pos_cahier/model/menu-group.dart';

import 'package:pos_cahier/share/globals.dart' as globals;

class MenuGroupApiClient  {
    String serverPath = globals.serverPath;

    Future<List<MenuGroup>> getAllMenuGroup(String restoCode) async {

        List<MenuGroup> menuGroups =[];

        String apiUrl = serverPath + '/menu-group/filter';
        Map data = {
            'restoCode' : restoCode
        };

        var bodyJson = jsonEncode(data);

        var apiResult =await http.post(
            apiUrl,
            body: bodyJson
        );

        var jsonObj = json.decode(apiResult.body);

        if (jsonObj['rc']=='00'){
            if (jsonObj['data'] != []) {
                menuGroups = ( jsonObj['data'] as List ).map((i)=> MenuGroup.fromJson(i)).toList();
            }
            return menuGroups;
        }
        // throw new Exception('Error ' + jsonObj['message']); 
        return menuGroups;
    }


}