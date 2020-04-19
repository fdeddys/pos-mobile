

import 'package:pos_cahier/model/menu-item.dart';

class OrderDetail {

    final id;
    final orderId;
    final eMenuItem;
    final qty;
    final price;
    final String status;
    String statusDesc;
    MenuItem menuItem;

    OrderDetail(this.id, this.orderId, this.eMenuItem, this.qty, this.price, this.status, this.statusDesc);

    OrderDetail.fromJson(Map jsonMap)
        : id = jsonMap['id'],
        orderId = jsonMap['orderId'],
        eMenuItem = jsonMap['eMenuItem'],
        qty = jsonMap['qty'],
        price = jsonMap['price'],
        status = jsonMap['status'],
        statusDesc = jsonMap['statusDesc'],
        menuItem = MenuItem.fromJson(jsonMap['MenuItem']);

}