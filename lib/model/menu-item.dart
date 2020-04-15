
import 'package:pos_cahier/model/menu-group.dart';

class MenuItem {

    int id;
    int groupId;
    int restoId;
    String name;
    String desc;
    String imgURL;
    int price;
    int stock;
    int status;
    MenuGroup menuGroup;

    MenuItem(this.id, this.groupId, this.restoId, this.name, this.desc, this.imgURL, this.price, this.stock, this.status);

    MenuItem.fromJson(Map jsonMap) :
    id = jsonMap['id'],
    groupId = jsonMap['groupId'],
    restoId = jsonMap['restoId'],
    name = jsonMap['name'],
    desc = jsonMap['desc'],
    imgURL = jsonMap['imgURL'],
    price = jsonMap['price'],
    stock = jsonMap['stock'],
    status = jsonMap['status'],
    menuGroup = MenuGroup.fromJson(jsonMap['menuGroup']);
}