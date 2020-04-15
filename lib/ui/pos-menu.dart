
import 'package:flutter/material.dart';
import 'package:pos_cahier/ui/pos-food-selection.dart';


class MainMenu extends StatefulWidget {
    @override
    _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
                            child: Text('List meja'),
                            color: Colors.red,
                        )
                    ),
                    Flexible(
                        flex: 6,
                        fit: FlexFit.tight,
                        child: Container(
                            padding: EdgeInsets.all(3),
                            color: Colors.white24,
                            child: GridView.count(
                                crossAxisCount: 5,
                                children: <Widget>[
                                    Center(
                                        child: Card(
                                            child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Column(
                                                    children: <Widget>[
                                                        Container(
                                                            padding: const EdgeInsets.all(8),
                                                            child: Image.network('https://picsum.photos/250?image=1')
                                                        ),
                                                        Flexible(
                                                            child: Container(
                                                                padding: const EdgeInsets.all(1),
                                                                child: 
                                                                    Text('Barang 1',
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                                color: Colors.red,
                                                                                fontSize: 8
                                                                        ),
                                                                    ),
                                                          ),
                                                        )
                                                    ],
                                                ),
                                                ),
                                            ),
                                        ),
                                    Center(
                                        child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Column(
                                                  children: <Widget>[
                                                        
                                                        Flexible(
                                                                        child: Text('Barang 1',
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                      color: Colors.red,
                                                                                      fontSize: 8
                                                                              ),
                                                                          ),
                                                        ),
                                                        Image.network('https://picsum.photos/250?image=2'),
                                                    ],
                                                ),
                                                ),
                                        ),
                                    Center(
                                        child:Column(
                                            children: <Widget>[
                                                Flexible(
                                                    flex: 6, 
                                                    child: InkWell(
                                                        onTap: (){
                                                            Navigator.push(context, 
                                                              MaterialPageRoute(builder: (context ) => PosFoodSelector(menuGroupSelected: 99))
                                                            );
                                                        },
                                                        child: Image.network('https://picsum.photos/250?image=3')
                                                    )
                                                ),
                                                Flexible(
                                                    flex: 1,  
                                                    child: 
                                                        Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Text('Barang 1 barabfa bsdmbd ambdgfamnb ',
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                      color: Colors.blueAccent,
                                                                      fontSize: 8,
                                                                      fontWeight: FontWeight.bold,
                                                              )
                                                          ),
                                                        )
                                                ),
                                            ],
                                        )
                                        ),
                                    Center(
                                        child: Card(
                                            child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Container(
                                                    child: Image.network('https://picsum.photos/250?image=4')),
                                                ),
                                            ),
                                        ),
                                    Center(
                                        child: Card(
                                            child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Container(
                                                    child: Image.network('https://picsum.photos/250?image=5')),
                                                ),
                                            ),
                                        ),
                                    Center(
                                        child: Card(
                                            child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Container(
                                                    child: Image.network('https://picsum.photos/250?image=6')),
                                                ),
                                            ),
                                        ),
                                    Center(
                                        child: Card(
                                            child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Container(
                                                    child: Image.network('https://picsum.photos/250?image=1')),
                                                ),
                                            ),
                                        ),
                                    Center(
                                        child: Card(
                                            child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Container(
                                                    child: Image.network('https://picsum.photos/250?image=2')),
                                                ),
                                            ),
                                        ),
                                    Center(
                                        child: Card(
                                            child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Container(
                                                    child: Image.network('https://picsum.photos/250?image=3')),
                                                ),
                                            ),
                                        ),
                                    Center(
                                        child: Card(
                                            child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Container(
                                                    child: Image.network('https://picsum.photos/250?image=4')),
                                                ),
                                            ),
                                        ),
                                    Center(
                                        child: Card(
                                            child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Container(
                                                    child: Image.network('https://picsum.photos/250?image=5')),
                                                ),
                                            ),
                                        ),
                                    Center(
                                        child: Card(
                                            child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Container(
                                                    child: Image.network('https://picsum.photos/250?image=6')),
                                                ),
                                            ),
                                        ),
                                    Center(
                                        child: Card(
                                            child: InkWell(
                                                splashColor: Colors.blue.withAlpha(30),
                                                onTap: (){
                                                    print('card tap');
                                                },
                                                child: Container(
                                                    child: Image.network('https://picsum.photos/250?image=1')),
                                                ),
                                            ),
                                        ),
                                ],
                            ),
                        )
                    ),
                    // Flexible(
                    //     flex: 2,
                    //     child: Container(
                    //         color: Colors.white60,
                    //         child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             mainAxisAlignment: MainAxisAlignment.start,
                    //             children: <Widget>[
                    //                 Flexible(
                    //                     fit: FlexFit.tight,
                    //                     flex: 1,
                    //                     child: Container(
                    //                         color: Colors.greenAccent,
                    //                         child: Row(
                    //                             crossAxisAlignment: CrossAxisAlignment.start,
                    //                             mainAxisAlignment: MainAxisAlignment.start,
                    //                             children: <Widget>[
                    //                                 Flexible(
                    //                                     flex: 1,
                    //                                     fit: FlexFit.tight,
                    //                                     child: Container(color: Colors.indigoAccent,)
                    //                                 ),
                    //                                 Flexible(
                    //                                     flex: 3,
                    //                                     fit: FlexFit.tight,
                    //                                     child: Center(child: Text('Bayar'),)
                    //                                 ),
                    //                                 Flexible(
                    //                                     flex: 1,
                    //                                     fit: FlexFit.tight,
                    //                                     child: Container(color: Colors.orangeAccent,)
                    //                                 ),

                    //                             ],
                    //                         ),
                    //                     )
                    //                 ),
                    //                 Flexible(
                    //                     fit: FlexFit.tight,
                    //                     flex: 6,
                    //                     child: Container(color: Colors.white60,)
                    //                 ),
                    //             ],
                    //         ),
                    //     )
                    // ),

                ],
            ),
            // drawer: ,
        );
    }

}
