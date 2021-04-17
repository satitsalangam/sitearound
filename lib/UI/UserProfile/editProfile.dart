import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, 'Edit Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            showTitle(size, context),
            showTextFormField('FristName', 'Master'),
            showTextFormField('LastName', 'Manager'),
            showTextFormField('Position', 'Project Manager'),
            showTextFormField('Company', 'Swift Dynamics'),
            showTextFormField('E-Mail', 'Manager01@sitearound.com'),
            showTextFormField('Phone', '08xxxxxxxx'),
            showbtn()
          ],
        ),
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
  

  Widget showTitle(Size size, BuildContext context) {
    return Container(
      width: size.width,
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 3, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Profile',
              style: bl16Style,
            ),
            Icon(
              Icons.supervised_user_circle_rounded,
              size: 35,
              color: Colors.orange,
            )
          ],
        ),
      ),
    );
  }

  Widget showTextFormField(title, detail) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          TextFormField(
            enabled: false,
            style: bl14Style,
            // onChanged: (value) => userName = value.trim(),
            initialValue: detail,
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
}
