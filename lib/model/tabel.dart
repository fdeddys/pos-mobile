
import 'package:flutter/material.dart';
import 'package:pos_cahier/model/tabel-group.dart';

class Tabel {

    int id;
    String name;
    String groupTabelId;
    TabelGroup tabelGroup;

    Tabel(this.id, this.name, this.groupTabelId);

    Tabel.fromJson(Map jsonMap):
    id = jsonMap['id'],
    name = jsonMap['name'],
    groupTabelId = jsonMap['groupTabelId'];
    // tabelGroup = TabelGroup.fromJson(jsonMap['groupTabel']); 

}