
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pos_cahier/model/tabel-group.dart';

import 'dart:convert';
import 'package:pos_cahier/share/globals.dart' as globals;

class TabelGroupApiClient {

    String serverPath = globals.serverPath;

    Future<List<TabelGroup>> getAllGroupTabel(String restoCode) async {

        Map data = {
            'restoCode' : restoCode
        };
        List<TabelGroup> groupTabels = [];

        String apiUrl = serverPath + '/group-table/filter';

        var bodyJson = jsonEncode(data);

         var apiResult =await http.post(
            apiUrl,
            body:bodyJson
        );

        var jsonObj = json.decode(apiResult.body);

         if (jsonObj['rc']=='00'){
            // print('isi data==> [' + jsonObj['data']+']');
            if (jsonObj['data'] != []) {
                // OrderResult orderResult = OrderResult.fromJson(jsonObj);
                // return orderResult.orders;
                groupTabels = ( jsonObj['data'] as List ).map((i)=> TabelGroup.fromJson(i)).toList();
            }
            return groupTabels;
        }
        // throw new Exception('Error ' + jsonObj['message']); 
        return [];
    }
}