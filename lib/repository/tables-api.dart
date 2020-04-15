
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pos_cahier/model/tabel.dart';
import 'package:pos_cahier/share/globals.dart' as globals;

class TabelApi {
    String serverPath = globals.serverPath;

    Future<List<Tabel>> getTabelByRestoCode(String restoCode) async {
        
        Map data = {
            'restoCode' : restoCode
        };
        List<Tabel> tabels;

        String apiUrl = serverPath + '/tabel/page/1/count/10';

        var bodyJson = jsonEncode(data);

         var apiResult =await http.post(
            apiUrl,
            body:bodyJson
        );

        var jsonObj = json.decode(apiResult.body);

         if (jsonObj['rc']=='00'){
            if (jsonObj['data'] != []) {
                tabels = ( jsonObj['data'] as List ).map((i)=> Tabel.fromJson(i)).toList();
            }
        }
        throw new Exception('Error ' + jsonObj['message']); 

    }
}