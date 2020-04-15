
class GroupTabel {

    int id;
    String name;
    String restoCode;

    GroupTabel(this.id, this.name, this.restoCode);

    GroupTabel.fromJson(Map jsonMap) : 
    id = jsonMap['id'],
    name = jsonMap['name'],
    restoCode = jsonMap['restoCode'];

}