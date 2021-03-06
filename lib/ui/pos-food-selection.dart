import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pos_cahier/dbHelper/menu-group-item.dbrepository.dart';
import 'package:pos_cahier/dbHelper/menu-item.dbRepository.dart';
import 'package:pos_cahier/model/menu-group.dart';
import 'package:pos_cahier/model/menu-item.dart';
import 'package:pos_cahier/model/order-detail.dart';
import 'package:pos_cahier/model/order.dart';

import 'package:pos_cahier/repository/order-detail-api.dart';
import 'package:intl/intl.dart';

class PosFoodSelector extends StatefulWidget {

    final int menuGroupSelected;
    const PosFoodSelector({Key key, this.menuGroupSelected}) : super(key: key);

    @override
    _PosFoodSelectorState createState() => _PosFoodSelectorState(menuGroupSelected);
}

enum TrxPopMenu { printInvoice, printCaption, movingTable, joinBill, Payment }

class _PosFoodSelectorState extends State<PosFoodSelector> {

    final formatCurrency = new NumberFormat.currency(symbol: 'Rp');

    List<MenuGroup> menuGroups =[];
    List<MenuItem> menuItemAlls = [];
    List<MenuItem> menuItems = [];
    // final MenuGroupApiClient menuGroupApiClient = MenuGroupApiClient();
    // final MenuItemApiClient tabelApi = MenuItemApiClient();
    final OrderDetailApi orderDetailApi = OrderDetailApi();
    

    MenuItemDbRepository itemRepository = new MenuItemDbRepository();
    MenuGroupItemRepository menuGroupItemRepository = new MenuGroupItemRepository();

    String restoCode = 'RD0001';
    Order order ;
    List<OrderDetail> orderDetails = [];

    _PosFoodSelectorState(int menuGroupSelected);

    bool isLoadingItem = true;
    @override
    void initState() {
        super.initState();
        getDataMenuGroup();
        getOrderByTable();
        getOderDetail(order.id);
        
        setState(() {
            isLoadingItem = false;  
         });
    }

    getOrderByTable() {
        order = new Order(151, 'ORDER99', 1, '2020-04-21', 72, 10000, 1, '0', 'unpaid', '0', '', 1, '', 0, 'voucherCode', 10000, 0, 0, 10000);
        
    }

    Future<int> getOderDetail(int orderId) async{
        print('start get detail ');
        orderDetails = await orderDetailApi.getAllOrderDetailByOrderId(151);
        print('total detail ' + orderDetails.length.toString());
        setState(() {
            
         });
        countTotal();
    }

    getDataMenuGroup() async {

        print('retrieve all data');

        // menuGroups = await menuGroupApiClient.getAllMenuGroup('RD0001');
        menuGroups = await menuGroupItemRepository.getAll();
        for (var menugr in menuGroups) {
            print('item group ' + menugr.name);
        }

        // menuItemAlls = await tabelApi.getAllMenuItem('RD0001');
        menuItemAlls = await itemRepository.getAllMenuItem();
        for (var data in menuItemAlls) {
            print('item = ' + data.name);
        }

        print('Menu group => ' + this.menuGroups.length.toString());
        print('Menu item => ' + this.menuItemAlls.length.toString());

        if (menuGroups.length>0) {
            fillTabelItems(menuGroups[0].id.toString());
        }

        setState(() { });
    }

    updateQty(int menuItemId, int qty){
        for (var i = 0; i < orderDetails.length ; i++) {
            print('compare ' + orderDetails[i].menuItem.id.toString() + '  ' +menuItemId.toString());
            if (orderDetails[i].menuItem.id == menuItemId) {
                setState(() {
                    orderDetails[i].qty = orderDetails[i].qty + qty;  
                });
                countTotal();            
                return;
            }
        }
    }

    addItem(MenuItem menuItem ){

        if (orderDetails.length > 0) {
            for (var i = 0; i < orderDetails.length ; i++) {
                print('compare ' + orderDetails[i].menuItem.id.toString() + '  ' + menuItem.id.toString());
                if (orderDetails[i].menuItem.id == menuItem.id) {
                    setState(() {
                        orderDetails[i].qty++;  
                    });
                    print('update qty');
                    countTotal();            
                    return;
                }
            }
        }
          
        OrderDetail orderDetail = new OrderDetail(1, order.id, menuItem.id, 1, menuItem.price, '0', ''); 
        orderDetail.menuItem = menuItem;
        print('add new item id->' + orderDetail.menuItem.id.toString());
        setState(() {
            orderDetails.add(orderDetail);
        });
        countTotal();
    }

    countTotal() async {
        int total =0;
        for (var i = 0; i < orderDetails.length; i++) {
            total+=(orderDetails[i].price * orderDetails[i].qty);   
        }
        setState(() {
            order.grandTotal = total;
        });
        
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
                actions: <Widget>[
                    popupmenu(),
                ]
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
                        child: 
                            isLoadingItem == false ? 
                            Container(
                                  padding: EdgeInsets.all(3),
                                  color: Colors.white24,
                                  child: listItem(),
                            ) 
                            :
                            FittedBox(
                                fit: BoxFit.none,
                                child: CircularProgressIndicator( valueColor: AlwaysStoppedAnimation(Colors.red) )
                            ) 
                    ),

                    Flexible(
                        flex: 3,
                        child: summaryItem()
                    ),

                ],
            )
        );
    }

    Widget popupmenu() {
        return
            PopupMenuButton<TrxPopMenu>(
                elevation: 10.0,
                icon: Icon(Icons.toc),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                    Radius.circular(10),
                    )
                ),
                color: Colors.grey.shade200,
                onSelected: (TrxPopMenu result) { print('Result ' + result.toString() ); },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<TrxPopMenu>>[
                    const PopupMenuItem<TrxPopMenu>(
                        value: TrxPopMenu.printCaption,
                        child: Text('Print invoice'),
                    ),
                    const PopupMenuItem<TrxPopMenu>(
                        value: TrxPopMenu.printInvoice,
                        child: Text('Print caption'),
                    ),
                    PopupMenuDivider(),
                    const PopupMenuItem<TrxPopMenu>(
                        value: TrxPopMenu.joinBill,
                        child: Text('Join Bill'),
                    ),
                    const PopupMenuItem<TrxPopMenu>(
                        value: TrxPopMenu.movingTable,
                        child: Text('Move table'),
                    ),
                    PopupMenuDivider(),
                    const PopupMenuItem<TrxPopMenu>(
                        value: TrxPopMenu.Payment,
                        child: Text('payment'),
                    ),
                ],
            );
                
    }

    Widget listItemGroup() {
      return Container(
          color: Colors.blue.shade200,
          child: ListView.builder(
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
            //   separatorBuilder: (context, index) {
            //       return Divider();
            //   }, 
              itemCount: menuGroups.length),
      );
    }

    Widget groupItemDetail(idx) {
        return ListTile(
            dense:true,
            contentPadding: EdgeInsets.only(left: 8.0, right: 2.0, top: 0.0, bottom: 0.0),
          title: 
              Text('${menuGroups[idx].name}', style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),), 
        );
    }

    Widget listItem() {
        return Container(
            color: Colors.grey.shade200,
            padding: EdgeInsets.all(3),
            child: GridView.count(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisCount: 4,
              children: new List<Widget>.generate(menuItems.length, (idx){
                  return 
                      Container(
                          padding: EdgeInsets.all(3),
                          color: Colors.white,
                        child: Column(
                            children: <Widget>[
                                Flexible(
                                      flex: 6, 
                                      child: InkWell(
                                          
                                          onTap: (){
                                              addItem(menuItems[idx]);
                                          },
                                          child: menuItems[idx].imgURL =='' ?  Image(image :  AssetImage('images/no-image.png'))
                                                // Image.network('https://via.placeholder.com/100')
                                                // FadeInImage.assetNetwork(
                                                //     placeholder: 'images/blue_loading.gif',
                                                //     image: 'https://via.placeholder.com/100',
                                                   
                                                // )
                                              : Image.network('${menuItems[idx].imgURL}')
                                      )
                                  ),
                                Flexible(
                                    flex: 2,  
                                    child: 
                                        Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text('${menuItems[idx].name}',
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: TextStyle(
                                                        color: Colors.grey.shade800,
                                                        fontSize: 8,
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

    Widget summaryItem() {
        return Container(
                color: Colors.white60,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: headerSummary()
                        ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 6,
                            // child: listDetail()
                            child: Container(
                                color: Colors.green.shade100,
                                child: listDetail(),
                            )
                        ),
                        // Flexible(
                        //     fit: FlexFit.tight,
                        //     flex: 1,
                        //     child: footerButton()
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: footerSummary()
                        ),
                    ],
                ),
            );
    }

    Widget headerSummary() {
        return 
            Container(
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
            );
    }

    Widget footerSummary() {
        return
            Container(
                padding: EdgeInsets.all(4),
                color: Colors.blueAccent,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Text('Total : ${formatCurrency.format(order.grandTotal)}',
                                overflow: TextOverflow.ellipsis,
                                style: 
                                    TextStyle(
                                        wordSpacing: 1.0,
                                        fontSize: 15, 
                                        color: Colors.white),
                                    )
                        ),
                    ]
              ),
            );
    }

    Widget footerButton() {
        return
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ActionChip(
                              avatar: CircleAvatar(
                                  backgroundColor: Colors.blue.shade800,
                                  child: Text('P'),
                              ),
                              label: Text('caption', style: TextStyle(fontSize: 10),),
                              onPressed: () {
                                  print("If you stand for nothing, Burr, what’ll you fall for?");
                              }
                          ),
                          // child: RaisedButton(
                          //     onPressed: (){
                          //         print('cetak');
                          //     }, 
                          //     child: Text('Print'),
                          // )
                      ),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ActionChip(
                              elevation: 20,
                              pressElevation: 5,
                              avatar: CircleAvatar(
                                  backgroundColor: Colors.blue.shade800,
                                  child: Text('P', style: TextStyle(fontSize: 10)),
                              ),
                              label: Text('bill', style: TextStyle(fontSize: 10),),
                              onPressed: () {
                                  print("If you stand for nothing, Burr, what’ll you fall for?");
                              }
                          ),
                      ),
                  ]
              ),
            );
    }

    Widget listDetail() {
        return ListView.builder(
            itemExtent: 95.0,
                itemCount: orderDetails != null ? orderDetails.length : 0,
                itemBuilder:(context, idx) {
                    return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                Text('${orderDetails[idx].menuItem.name}',
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: 
                                        TextStyle
                                            (color: Colors.blue,
                                                fontSize: 15)
                                        ),
                                Text('${formatCurrency.format(orderDetails[idx].price)} ',
                                    style: 
                                        TextStyle
                                            (color: Colors.green,
                                                fontSize: 15)
                                    ),
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                          Expanded(
                                              flex: 4,
                                              child: 
                                                  RawMaterialButton(
                                                      child: Icon(
                                                          Icons.add,
                                                          color: Colors.red,
                                                          size: 15.0,
                                                      ),
                                                      shape: new RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(25.0),
                                                          side: BorderSide(color: Colors.red)
                                                      ),
                                                      elevation: 5.0,
                                                      fillColor: Colors.white,
                                                      padding: const EdgeInsets.all(5.0), 
                                                      onPressed: () {
                                                          updateQty(orderDetails[idx].menuItem.id, 1);
                                                       },
                                                  ),
                                          ),

                                          SizedBox(width: 10.0),

                                          Expanded(
                                              flex: 3, 
                                              child: 
                                                  RawMaterialButton(
                                                      child: Text(' ${orderDetails[idx].qty*1} ',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15
                                                          ),
                                                      ),
                                                      // shape: new RoundedRectangleBorder(
                                                      //     borderRadius: new BorderRadius.circular(25.0),
                                                      //     side: BorderSide(color: Colors.blue)
                                                      // ),
                                                      elevation: 5.0,
                                                      fillColor: Colors.redAccent,
                                                      padding: const EdgeInsets.all(5.0), 
                                                      onPressed: () {
                                                          
                                                       },
                                                  ),
                                                  // Text(' x ${orderDetails[idx].qty} ',textAlign: TextAlign.center,)
                                              ),
                                          
                                          SizedBox(width: 10.0),

                                          Expanded(
                                              flex: 4,
                                              child: 
                                                  RawMaterialButton(
                                                      child: Icon(
                                                          Icons.remove,
                                                          color: Colors.red,
                                                          size: 15.0,
                                                      ),
                                                      shape: new RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(25.0),
                                                          side: BorderSide(color: Colors.red)
                                                      ),
                                                      elevation: 5.0,
                                                      fillColor: Colors.white,
                                                      padding: const EdgeInsets.all(5.0),
                                                       
                                                      onPressed: () { 
                                                          orderDetails[idx].qty < 1 ? null : updateQty(orderDetails[idx].menuItem.id, -1);
                                                      },
                                                  ),
                                          ),

                                      ],
                                  ),
                                )
                            ],
                        ),
                    );
                },
                // separatorBuilder: (context, index) {
                //     return Divider();
                // },
            );
    }

}