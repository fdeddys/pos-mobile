import 'package:flutter/material.dart';

class PosFoodSelector extends StatefulWidget {

    final int menuGroupSelected;
    const PosFoodSelector({Key key, this.menuGroupSelected}) : super(key: key);

    @override
    _PosFoodSelectorState createState() => _PosFoodSelectorState(menuGroupSelected);
}

class _PosFoodSelectorState extends State<PosFoodSelector> {

    _PosFoodSelectorState(int menuGroupSelected);

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
                      child: Container(
                          child: Text('List group'),
                      )
                    ),
                    Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: Container(
                          padding: EdgeInsets.all(3),
                          color: Colors.white24,
                          child: GridView.count(
                                crossAxisCount: 4,
                                children: <Widget>[
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
                                                        child: Image.network('https://picsum.photos/100')
                                                    )
                                                ),
                                                Flexible(
                                                    flex: 1,  
                                                    child: 
                                                        Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Text('Barang 1 ba ',
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
                                                        child: Image.network('https://picsum.photos/125')
                                                    )
                                                ),
                                                Flexible(
                                                    flex: 1,  
                                                    child: 
                                                        Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Text('Barang 1 ba ',
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
                                                        child: Image.network('https://picsum.photos/110')
                                                    )
                                                ),
                                                Flexible(
                                                    flex: 1,  
                                                    child: 
                                                        Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Text('Barang 1 ba ',
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
                                                        child: Image.network('https://picsum.photos/135')
                                                    )
                                                ),
                                                Flexible(
                                                    flex: 1,  
                                                    child: 
                                                        Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Text('Barang 1 ba ',
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
                                                        child: Image.network('https://picsum.photos/150')
                                                    )
                                                ),
                                                Flexible(
                                                    flex: 1,  
                                                    child: 
                                                        Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Text('Barang 1 ba ',
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
                                                        child: Image.network('https://picsum.photos/150?image=1')
                                                    )
                                                ),
                                                Flexible(
                                                    flex: 1,  
                                                    child: 
                                                        Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Text('Barang 1 ba ',
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
                                                        child: Image.network('https://picsum.photos/250?image=2')
                                                    )
                                                ),
                                                Flexible(
                                                    flex: 1,  
                                                    child: 
                                                        Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Text('Barang 1 ba ',
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
                                                          child: Text('Barang 1 ba ',
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
                                                        child: Image.network('https://picsum.photos/250')
                                                    )
                                                ),
                                                Flexible(
                                                    flex: 1,  
                                                    child: 
                                                        Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Text('Barang 1 ba ',
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
                                ],
                            ),
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
}