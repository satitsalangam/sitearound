import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sitearound/ulility/process_SingOut.dart';
import 'package:sitearound/ulility/text_style.dart';

import 'editProfile.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File file;
  Future<void> chooseImage(ImageSource source) async {
    try {
      var object = await ImagePicker()
          .getImage(source: source, maxHeight: 600.0, maxWidth: 600.0);
      setState(() {
        file = File(object.path);
        print('file>>>>>>>>>>>>$file');
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.orange,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'User Profile',
          style: bl22Style,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/tabbar1.png"),
            fit: BoxFit.cover,
          )),
        ),
        actions: [
          IconButton(
              icon: Icon(
                FontAwesomeIcons.signOutAlt,
                size: 25,
                color: Colors.orange,
              ),
              onPressed: () {
                processSignOut(context);
              })
        ],
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        radius: 52,
                        backgroundColor: Colors.orange,
                        child: CircleAvatar(
                          backgroundColor: Colors.orange[400],
                          radius: 51,
                          backgroundImage: file == null
                              ? AssetImage('assets/images/user.png')
                              : FileImage(file),
                        ),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   top: 50,
                //   right: 110,
                //   child: SizedBox(
                //     height: 35,
                //     width: 35,
                //     child: FlatButton(
                //       padding: EdgeInsets.zero,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(50),
                //         side: BorderSide(color: Colors.blue.withOpacity(0.3)),
                //       ),
                //       color: Colors.white54,
                //       onPressed: () {
                //         chooseImage(ImageSource.gallery);
                //       },
                //       child: Icon(
                //         FontAwesomeIcons.image,
                //         color: Colors.lightBlue,
                //         size: 25,
                //       ),
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 50,
                  right: 5,
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.orange.withOpacity(0.3)),
                      ),
                      color: Colors.white54,
                      onPressed: () {
                        chooseImage(ImageSource.camera);
                      },
                      child: Icon(
                        Icons.camera,
                        color: Colors.orange,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              'Master Manager',
              style: bl22Style,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: size.width,
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile',
                    style: orange18Style,
                  ),
                  Container(
                    // width: 45,
                    // decoration: BoxDecoration(
                    //   shape: BoxShape.circle,
                    //   color: Colors.orange[100],
                    //    border: Border.all(width: 1.0, color: Colors.orange),
                    // ),
                    child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.edit,
                          size: 20,
                          color: Colors.orange,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
          showTextFormField('FristName', 'Master'),
          showTextFormField('LastName', 'Manager'),
          showTextFormField('Position', 'Project Manager'),
          showTextFormField('Company', 'Swift Dynamics'),
          showTextFormField('E-Mail', 'Manager01@sitearound.com'),
          showTextFormField('Phone', '08xxxxxxxx'),
        ]),
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
            // inputFormatters: [
            //   LengthLimitingTextInputFormatter(15),
            // ],
            initialValue: detail,
            decoration: InputDecoration(
                // isDense: true,
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
