
class TabelGroup {

    int id;
    String name;
    String restoCode;

    TabelGroup(this.id, this.name, this.restoCode);

    TabelGroup.fromJson(Map jsonMap) : 
    id = jsonMap['id'],
    name = jsonMap['name'],
    restoCode = jsonMap['restoCode'];

}