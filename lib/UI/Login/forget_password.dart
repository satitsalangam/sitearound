import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Forget Password'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.orange[50]),
                  child: Icon(
                    FontAwesomeIcons.userLock,
                    color: Colors.orange,
                    size: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 30, bottom: 30),
              child: Text(
                'To recover your password. Please enter your registered email or Phone number',
                style: bl14Style,
              ),
            ),
            showTextFormField('Email Address'),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text('OR', style: bl16Style),
            ),
            showTextFormField('Phone Number'),
            showbtn(),
          ],
        ),
      ),
    );
  }

  Widget showTextFormField(title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          TextFormField(
            enabled: false,
            style: bl14Style,
            // onChanged: (value) => userName = value.trim(),
            // inputFormatters: [
            //   LengthLimitingTextInputFormatter(15),
            // ],
            // initialValue: detail,
            decoration: InputDecoration(
                isDense: true,
                labelText: title,
                labelStyle: bl14Style,
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
        ],
      ),
    );
  }

  Widget showbtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ElevatedButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 120),
              backgroundColor: Colors.orange),
          onPressed: () {},
          child: Text(
            'SAVE',
            style: wl22Style,
          )),
    );
  }
}
