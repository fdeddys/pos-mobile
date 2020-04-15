
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:pos_cahier/share/globals.dart' as globals;
import 'package:pos_cahier/model/group-table.dart';

class TabelGroupApiClient {

    String serverPath = globals.serverPath;

    Future<List<GroupTabel>> getAllGroupTabel(String restoCode) async {

        Map data = {
            'restoCode' : restoCode
        };
        List<GroupTabel> groupTabels;

        String apiUrl = serverPath + '/group-tabel/page/1/count/1000';

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
                groupTabels = ( jsonObj['data'] as List ).map((i)=> GroupTabel.fromJson(i)).toList();
            }
        }
        throw new Exception('Error ' + jsonObj['message']); 

    }
}