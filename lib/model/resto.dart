class Resto {
    
    int id;
    String name;
    String restoCode;
    String desc;
    String address;
    String city;
    String province;
    int status;

    Resto(this.id, this.name, this.restoCode, this.desc, this.address, this.city, this.province, this.status);

    Resto.fromJson(Map jsonMap)
    :   id = jsonMap['id'],
        name = jsonMap['name'],
        restoCode = jsonMap['restoCode'],
        desc = jsonMap['desc'],
        address = jsonMap['address'],
        city = jsonMap['city'],
        status = jsonMap['status'],
        province = jsonMap['province'];
}