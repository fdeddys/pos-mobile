import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_cahier/ui/login/login.dart';
import 'package:pos_cahier/ui/pos-menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

    // full screen
  SystemChrome.setEnabledSystemUIOverlays ([]);
  
  // landscape
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
        .then((_) {
        runApp(MyApp3());
  });
}

class MyApp extends StatelessWidget {

    const MyApp({Key key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'POS ',
          theme: ThemeData(primarySwatch: Colors.blue,),
          home: MainMenu(),
        );
    }
}

class MyApp2 extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text("POS"),),
            body: MainMenu(),
        );
    }
}

class MyApp3 extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                accentColor: Colors.white70
            ),
            home: Scaffold(
                resizeToAvoidBottomPadding: true,
                body: Login()
            ),
        );
    }
}
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),

//           ],
//         ),
//       ),
// // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
