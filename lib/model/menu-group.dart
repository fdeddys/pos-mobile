
class MenuGroup {
    int id;
    int restoId;
    String name;
    String imgUrl;
    int status;

    MenuGroup(this.id, this.restoId, this.name, this.imgUrl, this.status);

    MenuGroup.fromJson(Map JsonMap):
      id = JsonMap['id'],
      restoId = JsonMap['restoId'],
      name = JsonMap['name'],
      imgUrl = JsonMap['imgUrl'],
      status = JsonMap['status'];

    Map<String, dynamic> toMap() {
        Map<String, dynamic> map = Map<String, dynamic>();
        map['id'] = this.id;
        map['restoId'] = this.restoId;
        map['name'] = this.name;
        map['status'] = this.status;

        return map;
    }

}