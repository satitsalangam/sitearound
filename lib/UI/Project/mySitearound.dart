import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolling_nav_bar/rolling_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/project_Model.dart';
import 'package:sitearound/UI/UserProfile/userProfile.dart';
import 'package:sitearound/ulility/color_style.dart';
import 'sitearound_directory.dart';
import 'sitearound_image.dart';

class MySiteAround extends StatefulWidget {
  @override
  _MySiteAroundState createState() => _MySiteAroundState();
}

var tstyle = TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 50);

class _MySiteAroundState extends State<MySiteAround> {
  int _index = 0;
  List<Widget> pageWiget = <Widget>[
    SitearoundImage(),
    SitearoundDirectory(),
    // Project(),
  ];
  PageController controller = PageController();

  var iconData = <IconData>[
    Icons.dashboard,
    Icons.people_alt,
    // Icons.settings,
  ];
  var indicatorColors = <Color>[
    Colors.orange,
  ];

  var iconText = <Widget>[
    Text('Project', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('Directory', style: TextStyle(color: Colors.grey, fontSize: 12)),
    // Text('Setting', style: TextStyle(color: Colors.grey, fontSize: 12)),
  ];

  EndPoints endpoints = EndPoints();
  SharedPreferences prefs;
  Future<ProjectModel> getProjectList() async {
    prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.projectList,
    );
    ProjectModel projectList = projectModelFromJson(result.body);
    print('projectList>>>>>$projectList');
    print("result>>>>>>$result");
    return projectList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          double navBarHeight = scaledHeight(context, 85);
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: AppBar(
                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfile(),
                        ),
                      );
                    },
                    icon: Icon(
                      FontAwesomeIcons.userCircle,
                      size: 30,
                      color: Color(0xFFFFA200),
                    ),
                  ),
                ],
                title: Row(
                  children: [
                    Image.asset('assets/images/sitearound.png',
                        fit: BoxFit.fill, height: 28, width: 205),
                  ],
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/tabbar1.png"),
                    fit: BoxFit.cover,
                  )),
                ),
                toolbarHeight: 90,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                elevation: 10,
              ),
            ),
            body: PageView.builder(
                itemCount: 2,
                controller: controller,
                onPageChanged: (page) {
                  setState(() {
                    _index = page;
                  });
                },
                itemBuilder: (context, position) {
                  return Container(
                    child: pageWiget[position],
                  );
                }),
            bottomNavigationBar: Container(
              height: navBarHeight,
              width: MediaQuery.of(context).size.width,
              child: RollingNavBar.iconData(
                activeIndex: _index,
                animationCurve: Curves.linear,
                animationType: AnimationType.roll,
                baseAnimationSpeed: 400,
                iconData: iconData,
                iconColors: <Color>[Colors.grey[800]],
                iconText: iconText,
                indicatorColors: indicatorColors,
                iconSize: 25,
                indicatorRadius: scaledHeight(context, 30),
                onTap: (index) {
                  setState(() {
                    _index = index;
                  });
                  controller.jumpToPage(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
