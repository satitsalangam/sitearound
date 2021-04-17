import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/UI/Login/forget_password.dart';
import 'package:sitearound/UI/Login/login.dart';
import 'package:sitearound/UI/Project/mySitearound.dart';
import 'package:sitearound/UI/homePage/sitearound_homepage.dart';
import 'package:sitearound/ulility/normal_dialog.dart';
import 'package:sitearound/ulility/text_style.dart';

enum AuthFormType { signIn }

class LoginCredential extends StatefulWidget {
  @override
  _LoginCredentialState createState() => _LoginCredentialState();
}

class _LoginCredentialState extends State<LoginCredential> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _email, _password;

  Future<void> login(String _email, String _password) async {
    final SharedPreferences prefs = await _prefs;
    clientAuth client = clientAuth();
    client.post({
      'username': _email,
      'password': _password,
      'grant_type': 'password',
      'client_id': 'ZGxQ8cvwYuU0AGzYWUQXRMiSywVtkUX0Be7ZeRLs',
      'client_secret':
          'BhnGJJdRx4rgxc6mzk9gLZD4MfikB7y9cfXLfauq3wiZiXOsvEcItC9mqyEDF3ETvXYJfEH3JvEx9fh3CfwnXiAyEwAEU0sWXZ7aAPOUxm4WIHdMGjB2araX3gEVYsD9'
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
            MaterialPageRoute(builder: (context) => MySiteAround()),
            (route) => false);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MySiteAround(),
        //   ),
        // );
        print('user = $user');
      } else if (response.statusCode == 400 || response.statusCode == 404) {
        normalDialog(context, 'username or password is incorrect', '');
      } else {
        normalDialog(context, 'ไม่สามารถเชื่อมต่อ Server ได้1111', '');
      }
      {
        print('error>>>>${response.statusCode}');
      }
    }).catchError((error) {
      prefs.setBool('authStatus', false);
      normalDialog(context, 'ไม่สามารถเชื่อมต่อ Server ได้', '');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 160, bottom: 30),
            height: size.height / 2,
            width: size.width / 1,
            child: Card(
              semanticContainer: true,
              elevation: 10,
              margin: const EdgeInsets.only(
                  right: 20, left: 20, bottom: 20, top: 30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 6, right: 4, top: 10, bottom: 55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    showTitle(),
                    Spacer(),
                    showUserName(),
                    Divider(),
                    showPassword(),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    showSingup(),
                    Spacer(),
                    showbtnLogin(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showbtnLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        new Expanded(
          child: new NiceButton(
            width: 100,
            elevation: 8.0,
            radius: 8,
            padding:
                const EdgeInsets.only(bottom: 7, top: 5, left: 15, right: 15),
            text: "Login",
            textColor: Colors.white,
            fontSize: 18,
            gradientColors: [Colors.orange, Colors.orange],
            onPressed: () async {
              if (_email == null ||
                  _email.isEmpty ||
                  _password == null ||
                  _password.isEmpty) {
                normalDialog(context, 'กรุณากรอกข้อมูลให้ครบถ้วน', '');
              } else {
                await login(_email, _password);
              }
            },
            background: null,
          ),
        ),
      ],
    );
  }

  Widget showSingup() {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ForgetPassword(),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Forgot your password ?",
              style: bl14Style,
            ),
          ],
        ),
      ),
    );
  }

  Widget showPassword() {
    return TextFormField(
      decoration: new InputDecoration(
        contentPadding: new EdgeInsets.only(top: 9, left: 10, bottom: 1),
        border: InputBorder.none,
        hintText: 'Enter your Password',
        hintStyle: or15Style,
        // labelText: 'Password',
        // labelStyle: bl15Style,
        suffixIcon: Icon(Icons.lock, color: Colors.orange),
      ),
      onChanged: (value) => _password = value.trim(),
      keyboardType: TextInputType.text,
      autocorrect: true,
      obscureText: true,
    );
  }

  Widget showUserName() {
    return TextFormField(
      // showCursor: false,
      decoration: new InputDecoration(
        // floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: new EdgeInsets.only(left: 10, bottom: 1, top: 23),
        border: InputBorder.none,
        hintText: 'Email Address',
        hintStyle: or15Style,
        // labelText: 'Username',
        // labelStyle: bl15Style,
        suffixIcon: Icon(Icons.person_outline, color: Colors.orange),
      ),
      onChanged: (value) => _email = value.trim(),
      validator: EmailValidator.validate,
      keyboardType: TextInputType.text,
      autocorrect: false,
    );
  }

  Widget showTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 26),
      child: Image(
        image: AssetImage("assets/images/sitearound.png"),
        height: 35,
        width: 235,
        fit: BoxFit.contain,
        alignment: Alignment.center,
      ),
    );
  }
}
