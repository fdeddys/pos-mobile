
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_cahier/dbHelper/menu-group-item.dbrepository.dart';
import 'package:pos_cahier/dbHelper/menu-item.dbRepository.dart';
import 'package:pos_cahier/model/menu-group.dart';
import 'package:pos_cahier/model/menu-item.dart';
import 'package:pos_cahier/model/tabel-group.dart';
import 'package:pos_cahier/model/tabel.dart';
import 'package:pos_cahier/repository/menu-group-api.dart';
import 'package:pos_cahier/repository/menu-item-api.dart';
import 'package:pos_cahier/repository/table-group-api.dart';
import 'package:pos_cahier/repository/tables-api.dart';
import 'package:pos_cahier/ui/pos-food-selection.dart';


class MainMenu extends StatefulWidget {
    @override
    _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

    List<TabelGroup> tabelGroups =[];
    List<Tabel> tabelAlls = [];
    List<Tabel> tabels = [];
    final TabelGroupApiClient tabelGroupApiClient = TabelGroupApiClient();
    final TabelApi tabelApi = TabelApi();
    final MenuGroupApiClient menuGroupApiClient = MenuGroupApiClient();
    final MenuItemApiClient menuItemApi = MenuItemApiClient();
    final formatCurrency = new NumberFormat.currency(symbol: 'Rp');
    
    MenuItemDbRepository itemRepository = new MenuItemDbRepository();
    MenuGroupItemRepository menuGroupRepository = new MenuGroupItemRepository();

    String restoCode = 'RD0001';

    @override
    void initState() {
        super.initState();
        getDataMenuGroup(restoCode);
    }

    getDataMenuGroup(String restoCode)async {
        tabelGroups = await tabelGroupApiClient.getAllGroupTabel(restoCode);
        tabelAlls = await tabelApi.getTabelByRestoCode(restoCode);
        print('Menu => total ' + this.tabelGroups.length.toString());
        print('tabel => ' + this.tabelAlls.length.toString());

        print('for each');
        if (tabelGroups.length>0) {
            fillTabels(tabelGroups[0].id.toString());
        }
        setState( () => {
        });
        await getAllDataItem(restoCode);
        await getAllDataGroupItem(restoCode);
    }   

    getAllDataItem(String restoCode) async {
        
        List<MenuItem> menuItemAlls = [];

        print('get API');
       
        menuItemAlls = await menuItemApi.getAllMenuItem(restoCode);


        print('insert all data DB');
        for (var menuItem in menuItemAlls) {
            await itemRepository.insert(menuItem);
        }
        
        print('retrieve all data');
        List<MenuItem> allData = await itemRepository.getAllMenuItem();
        for (var data in allData) {
            print('item ' + data.id.toString());
        }
    }

    getAllDataGroupItem(String restoCode) async {
        List<MenuGroup> menuGroups =[];
        menuGroups = await menuGroupApiClient.getAllMenuGroup(restoCode);

        for (var menuGroup in menuGroups) {
            await menuGroupRepository.insert(menuGroup);
        }
        
        print('retrieve all menu group');
        List<MenuGroup> allData = await menuGroupRepository.getAll();
        for (var data in allData) {
            print('item group ->' + data.id.toString());
        } 
    }

    fillTabels(String groupTabelId) {
        tabels =[];
        for (var tabel in tabelAlls) {
            print('compate => ['+ tabel.groupTabelId.toString() + '] with [' +groupTabelId + ']');
            if (tabel.groupTabelId.toString() == groupTabelId) {
                print('added');
                tabels.add(tabel);
            }
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('POS Cashier'),
            ),
            body: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Container(
                            child: listTabelGroup(),
                        )
                    ),
                    Flexible(
                        flex: 6,
                        fit: FlexFit.tight,
                        child: Container(
                            padding: EdgeInsets.all(3),
                            color: Colors.white24,
                            child: listTable2(),
                        )
                    ),

                ],
            ),
            // drawer: ,
        );
    }


    Widget listTabelGroup() {
        return Container(
            color:  Colors.blue.shade200,
            child: Center(
                child: ListView.separated(
                    itemBuilder: (context, idx) {
                        return GestureDetector(
                        child: groupMenuDetail(idx),
                        onTap: () { 
                            print('tap ' + idx.toString());
                            fillTabels(tabelGroups[idx].id.toString());
                            setState( () => { });
                        }, 
                        );
                    }, 
                    separatorBuilder: (context, index) {
                        return Divider();
                    }, 
                    itemCount: tabelGroups.length),
            ),
        );
    }

    Widget groupMenuDetail(idx) {
        return ListTile(
          title: 
              Text( '${tabelGroups[idx].name}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12
              ), ), 
        );
    }

    Widget listTable2() {
        return Container(
            color: Colors.grey.shade200,
            // padding: EdgeInsets.all(2),
          child: GridView.count(
              crossAxisCount: 6,
            //    crossAxisSpacing: 2,
            //     mainAxisSpacing: 2,
              children: new List<Widget>.generate(tabels.length, (idx){
                  return 
                      Container(
                          padding: EdgeInsets.all(2),
                          color: Colors.white,
                        child: Column(
                            children: <Widget>[
                                Flexible(
                                    flex: 5, 
                                    child: InkWell(
                                        onTap: (){
                                            Navigator.push(context, 
                                                MaterialPageRoute(builder: (context ) => PosFoodSelector(menuGroupSelected: 99))
                                            );
                                        },
                                        // child: Image.network('https://via.placeholder.com/50')
                                        child: 
                                          Image(image :  AssetImage('images/meja.jpg'))
                                    )
                                ),
                                Flexible(
                                    flex: 2,  
                                    child: 
                                        Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text('${tabels[idx].name}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                        color: Colors.blueAccent,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                )
                                            ),
                                        )
                                ),
                                 Flexible(
                                    flex: 2,  
                                    child: 
                                        Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text('open',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                        color: Colors.blueAccent,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                )
                                            ),
                                        )
                                ),
                            ],
                        ),
                      );
              }),
          ),
        );
    }

    // Widget listTabel() {
    //     return GridView.count(
    //         crossAxisCount: 5,
    //         children: <Widget>[
    //             Center(
    //                 child:Column(
    //                     children: <Widget>[
    //                         Flexible(
    //                             flex: 6, 
    //                             child: InkWell(
    //                                 onTap: (){
    //                                     Navigator.push(context, 
    //                                         MaterialPageRoute(builder: (context ) => PosFoodSelector(menuGroupSelected: 99))
    //                                     );
    //                                 },
    //                                 child: Image.network('https://via.placeholder.com/100')
    //                             )
    //                         ),
    //                         Flexible(
    //                             flex: 1,  
    //                             child: 
    //                                 Padding(
    //                                     padding: const EdgeInsets.all(2.0),
    //                                     child: Text('Barang 1 barabfa bsdmbd ambdgfamnb ',
    //                                         overflow: TextOverflow.ellipsis,
    //                                         style: TextStyle(
    //                                                 color: Colors.blueAccent,
    //                                                 fontSize: 8,
    //                                                 fontWeight: FontWeight.bold,
    //                                         )
    //                                     ),
    //                                 )
    //                         ),
    //                     ],
    //                 )
    //             ),
    //         ],
    //     );
    // }

}
