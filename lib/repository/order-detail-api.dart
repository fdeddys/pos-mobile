import 'dart:convert';

import 'package:pos_cahier/model/order-detail.dart';
import 'package:pos_cahier/share/globals.dart' as globals;
import 'package:http/http.dart' as http;

class OrderDetailApi {

    String serverPath = globals.serverPath;
 
    Future<List<OrderDetail>> getAllOrderDetailByOrderId(int orderId) async {

        List<OrderDetail> orderResult = [] ;
        String _orderUrl = serverPath + '/order/detail/$orderId';
        print('url' + _orderUrl);
        final response = await http.get(_orderUrl);
       

        // if (response.statusCode != 200) {
        //     throw new Exception('error getting data');
        // }

        final jsonObj = json.decode(response.body) as Map<String, dynamic>;
       
        if (jsonObj['rc'] == '00') {
            if (jsonObj['data'] != []) {
                orderResult = (jsonObj['data'] as List).map((orderDetail)=> OrderDetail.fromJson(orderDetail)).toList();
            }
            
        }
        print('get detail ' + jsonObj['message']);
        return orderResult;
    }

}