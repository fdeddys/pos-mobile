import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_cahier/main.dart';
import 'package:pos_cahier/ui/pos-menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
    @override
    _LoginState createState() => _LoginState();
}

TextEditingController txtNameController = TextEditingController();
TextEditingController txtPassController = TextEditingController();

class _LoginState extends State<Login> {

    bool _isLoading = false;

    signIn(String email, pass) async {
        
        print(email + '-' + pass);
        var emailPass = utf8.encode(email + pass); // data being hashed
        var hashPass = sha256.convert(emailPass);
        print("Hash pass: $hashPass");

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        Map data = {
            'email': email,
            'password': hashPass.toString()
        };

        print(' before encode ');
        var bodyJson = json.encode(data);

        print('hasil json encode $bodyJson ');
        var jsonResponse = null;
        var response = await http.post(
            "http://156.67.214.228:8001/v0.1.0/auth/login",
            headers: {"Content-Type": "application/json"},
            body: bodyJson);
        print('hasil $response');

        if (response.statusCode == 200) {
            jsonResponse = json.decode(response.body);
            setState(() {
                _isLoading = false;
            });
            print('hasil ${response.body}');
            if (jsonResponse != null) {
                
                // if (response.body.rc === '00')
                // var jsonObject = json.decode(response.body);
                var rc = jsonResponse['rc'];
                if (rc == '00') {
                    // print('Result from login =?' + jsonResponse.toString());
                    
                    
                    var restoCode = jsonResponse['data']['Resto']['restoCode'];

                    // var resto = Resto.fromJson(jsonResponse['data']['Resto']);
                    var restoId = jsonResponse['data']['restoId'];
                    var token = jsonResponse['token'];
                    // print('resto code ' + restoCode + '  token ' + token); 

                    // LoginData data = new LoginData(0, restoCode , token, resto.name, resto.desc, resto.address, resto.city, resto.province );
                    // int result = await dbHelper.insert(data);

                    sharedPreferences.setString("token", token);
                    sharedPreferences.setString("restoCode", restoCode);
                    sharedPreferences.setInt("restoId", restoId);
                    // Navigator.of(context).pushAndRemoveUntil( 
                    //     MaterialPageRoute(builder: (BuildContext context) => MyApp()),
                    //     (Route<dynamic> route) => false
                    // );
                    Navigator.pushReplacement(context, 
                        MaterialPageRoute(builder: (context ) => MainMenu() )
                    );
                } else {
                    var msg = jsonResponse['message'];
                    print(msg);
                    Fluttertoast.showToast(
                        msg: msg,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white70,
                        fontSize: 15.0
                    );
                }
                
            }
        } else {
            print('hasil $response');
            setState(() {
            _isLoading = false;
            });
            print(response.body);
        }
    }

    @override
     Widget build(BuildContext context) {
        return  Scaffold(
                resizeToAvoidBottomPadding: true,
                body: loginPage(context)
        );
    }

    // Widget build(BuildContext context) {
    //     return MaterialApp(
    //         // title: "QR Food",
    //         debugShowCheckedModeBanner: false,
    //         theme: ThemeData(
    //             accentColor: Colors.white70
    //         ),
    //         home: Scaffold(
    //             resizeToAvoidBottomPadding: true,
    //             body: loginPage(context)
    //         ),
    //     );
    // }

    Widget loginPage(BuildContext context) {
        
    return
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Container(color: Colors.blue.shade300,),
                ),
                Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Container(
                        color: Colors.blue.shade100,
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                                child: PanelRight(),
                        ),
                    ),
                )

            ],
        );
    }

    Widget PanelRight() {
    return
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Container(),
                ),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 8,
                    child: inputPanel(),
                )
            ],
        );
    }

    Widget inputPanel() { 
    
    return
        SingleChildScrollView(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        inputEmail(),
                        inputPassword(),
                        buttonLogin(),
                    ],    
                ),
            ),
        );

    }

    Widget inputEmail() {
        return
            TextField(
                maxLines: 1,
                style: TextStyle(color: Colors.white),
                // autofocus: true,
                autocorrect: true,
                maxLength: 25,
                textAlign: TextAlign.center,
                controller: txtNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "email",
                    fillColor: Colors.white,
                    // border: OutlineInputBorder(),
                    icon: Icon(Icons.alternate_email)
                ),
            );
    }

    Widget inputPassword() {
        return
            TextField(
                maxLines: 1,
                autocorrect: true,
                maxLength: 25,
                textAlign: TextAlign.center,
                obscureText: true,
                controller: txtPassController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "password",
                    // border: OutlineInputBorder(),
                    icon: Icon(Icons.vpn_key)
                ),
            );
    }


    Widget buttonLogin() {
        return
            Padding(
                padding: EdgeInsets.all(8),
                child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xff01A0C7),
                    child: MaterialButton(
                        // minWidth: MediaQuery.of(context).size.width * 0.9,
                        minWidth: 200,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed:  (){
                             signIn(txtNameController.text, txtPassController.text);
                        }
                               
                        
                        // txtNameController.text == "" || txtPassController.text == "" ? null
                        //     : () {
                                
                        //         setState(() {
                        //             _isLoading = true;
                        //         });
                        //         signIn(txtNameController.text, txtPassController.text);
                        //     }
                            ,
                        child: Text("Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold)
                            ),
                    ),
            )
        );
    }

}
