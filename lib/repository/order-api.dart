import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:pos_cahier/model/order.dart';
import 'package:pos_cahier/share/globals.dart';

class OrderApi {

    Future<Order> updateOrderComplete(int orderId) async {

        Map data = {
            'id': orderId,
          	'status': 'COMPLETE'
        };
        var bodyJson = jsonEncode(data);

        String _orderUrl = serverPath + '/menu-item/filter';

        final response = await http.post(_orderUrl, body: bodyJson);
        if (response.statusCode != 200) {
            throw new Exception('error getting data');
        }

        final jsonObj = json.decode(response.body) as Map<String, dynamic>;
       
        if (jsonObj['rc'] != '00') {
            throw new Exception('Error ' + jsonObj['message']);
        }
        
        Order orderResult = Order.fromJson(jsonObj['data']);
        return orderResult;
    }
}