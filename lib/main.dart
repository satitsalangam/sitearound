import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/UI/Response/orientation_layout.dart';
import 'package:sitearound/UI/Response/screen_type_layout.dart';
import 'package:sitearound/ulility/text_style.dart';
import 'UI/Login/login.dart';
import 'UI/Project/mySitearound.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.black, statusBarBrightness: Brightness.light));
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: true,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.green
          //  accentColor: Colors.red,
          //  backgroundColor: Colors.black,
          ),
      title: 'Sitearound',
      home: MyFirstpage(),
    );
  }
}

class MyFirstpage extends StatefulWidget {
  @override
  _MyFirstpageState createState() => _MyFirstpageState();
}

class _MyFirstpageState extends State<MyFirstpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authStatus = prefs.getBool('authStatus') ?? false;
    if (authStatus) {
      //call Api refesh Token and Set prefs
      //Go to Project List Page
      clientAuth client = clientAuth();
      client.post({
        'username': prefs.getString('email'),
        'refresh_token': prefs.getString('refresh_token'),
        'grant_type': 'refresh_token',
        'client_id': 'ZGxQ8cvwYuU0AGzYWUQXRMiSywVtkUX0Be7ZeRLs',
        'client_secret':
            'BhnGJJdRx4rgxc6mzk9gLZD4MfikB7y9cfXLfauq3wiZiXOsvEcItC9mqyEDF3ETvXYJfEH3JvEx9fh3CfwnXiAyEwAEU0sWXZ7aAPOUxm4WIHdMGjB2araX3gEVYsD9',
      }).then((response) {
        if (response.statusCode == 200) {
          Map<String, dynamic> user = jsonDecode(response.body);
          prefs.setInt('id', user['id']);
          prefs.setBool('is_superuser', user['is_superuser']);
          prefs.setString('email', user['email']);
          prefs.setString(
              'fullName', '${user['first_name']} ${user['last_name']}');
          prefs.setString('access_token', user['token']['access_token']);
          prefs.setString('refresh_token', user['token']['refresh_token']);

          prefs.setBool('authStatus', true);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MySiteAround(),
              ),
              (route) => false);
        }
      }).catchError((error) {
        prefs.setBool('authStatus', false);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
      });
    } else {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: OrientationLayout(
            landscape: null,
            portrait: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/icons/logo.png', height: 100.0),
                  SizedBox(height: 20.0),
                  SpinKitCircle(
                    color: Colors.orangeAccent[400],
                    size: 25.0,
                  )
                ],
              ),
            )),
        tablet: Scaffold(
          body: Text('tablet',style: blue48Style,),
        ),
        desktop: null);
  }
}
