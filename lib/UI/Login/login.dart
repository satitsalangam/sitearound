import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/background-image.dart';
import 'components/sitearound_login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [LoginCredential()],
              ),
            ),
          ),
        ),
      ],
    );
  }

  
}
