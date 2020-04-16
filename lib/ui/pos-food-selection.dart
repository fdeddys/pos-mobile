import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pos_cahier/model/menu-group.dart';
import 'package:pos_cahier/model/menu-item.dart';
import 'package:pos_cahier/repository/menu-group-api.dart';
import 'package:pos_cahier/repository/menu-item-api.dart';

class PosFoodSelector extends StatefulWidget {

    final int menuGroupSelected;

    const PosFoodSelector({Key key, this.menuGroupSelected}) : super(key: key);

    @override
    _PosFoodSelectorState createState() => _PosFoodSelectorState(menuGroupSelected);
}

class _PosFoodSelectorState extends State<PosFoodSelector> {

    List<MenuGroup> menuGroups =[];
    List<MenuItem> menuItemAlls = [];
    List<MenuItem> menuItems = [];
    final MenuGroupApiClient menuGroupApiClient = MenuGroupApiClient();
    final MenuItemApiClient tabelApi = MenuItemApiClient();
    String restoCode = 'RD0001';

    _PosFoodSelectorState(int menuGroupSelected);

    
    @override
    void initState() {
        super.initState();
        getDataMenuGroup();
    }

    getDataMenuGroup()async {
        menuGroups = await menuGroupApiClient.getAllMenuGroup('RD0001');
        menuItemAlls = await tabelApi.getAllMenuItem('RD0001');
        print('Menu group => ' + this.menuGroups.length.toString());
        print('Menu item => ' + this.menuItemAlls.length.toString());

        if (menuGroups.length>0) {
            fillTabelItems(menuGroups[0].id.toString());
        }

        setState(() { });
    }

    fillTabelItems(String groupId) {
        menuItems =[];
        print('iterate ' + menuItemAlls.length.toString());

        // for (var i = 0; i < menuItemAlls.length--; i++) {
        //     print(menuItemAlls[i].id);
        // }
        for (var menuItem in menuItemAlls) {
            print('compare => ['+ menuItem.groupId.toString() + '] with [' +groupId + ']');
            if (menuItem.groupId.toString() == groupId) {
                print('added');
                menuItems.add(menuItem);
            }
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Transaction'),
            ),
            body: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: listItemGroup()
                    ),
                    Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: Container(
                            padding: EdgeInsets.all(3),
                            color: Colors.white24,
                            child: listItem(),
                        ) 
                    ),

                    Flexible(
                        flex: 3,
                        child: Container(
                            color: Colors.white60,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                    Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: Container(
                                            color: Colors.greenAccent,
                                            child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                    Flexible(
                                                        flex: 1,
                                                        fit: FlexFit.tight,
                                                        child: Container(color: Colors.indigoAccent,)
                                                    ),
                                                    Flexible(
                                                        flex: 3,
                                                        fit: FlexFit.tight,
                                                        child: Center(child: Text('Bayar'),)
                                                    ),
                                                    Flexible(
                                                        flex: 1,
                                                        fit: FlexFit.tight,
                                                        child: Container(color: Colors.orangeAccent,)
                                                    ),

                                                ],
                                            ),
                                        )
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        flex: 6,
                                        child: Container(color: Colors.white60,)
                                    ),
                                ],
                            ),
                        )
                    ),

                ],
            )
        );
    }

    Widget listItemGroup() {
      return Center(
          child: ListView.separated(
              itemBuilder: (context, idx) {
                  return GestureDetector(
                    child: groupItemDetail(idx),
                    onTap: () {
                        print('tap ' + menuGroups[idx].id.toString());
                        fillTabelItems(menuGroups[idx].id.toString());
                        setState( () => { });
                     }, 
                  );
              }, 
              separatorBuilder: (context, index) {
                  return Divider();
              }, 
              itemCount: menuGroups.length),
      );
    }

    Widget groupItemDetail(idx) {
        return ListTile(
          title: 
              Text('${menuGroups[idx].name}'), 
        );
    }

    Widget listItem() {
        return GridView.count(
            crossAxisCount: 4,
            children: new List<Widget>.generate(menuItems.length, (idx){
                return 
                    Column(
                        children: <Widget>[
                            Flexible(
                                flex: 6, 
                                child: InkWell(
                                    onTap: (){
                                    },
                                    child: menuItems[idx].imgURL =='' ? Image.network('https://via.placeholder.com/100') :   
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.network('${menuItems[idx].imgURL}'),
                                        )
                                )
                            ),
                            Flexible(
                                flex: 1,  
                                child: 
                                    Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Text('${menuItems[idx].name}',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                            )
                                        ),
                                    )
                            ),
                        ],
                    );
            }),
        );
    }

}