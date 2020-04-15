
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

}