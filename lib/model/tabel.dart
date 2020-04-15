
import 'package:flutter/material.dart';
import 'package:pos_cahier/model/group-table.dart';

class Tabel {

    int id;
    String name;
    int groupTabelId;
    GroupTabel groupTabel;

    Tabel(this.id, this.name, this.groupTabelId);

    Tabel.fromJson(Map jsonMap):
    id = jsonMap['id'],
    name = jsonMap['name'],
    groupTabelId = jsonMap['groupTable'],
    groupTabel = GroupTabel.fromJson(jsonMap['groupTabel']); 

}