import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolling_nav_bar/rolling_nav_bar.dart';
import 'package:sitearound/UI/homePage/more.dart';
import 'package:sitearound/UI/homePage/myHomeMenu.dart';
import 'package:sitearound/UI/homePage/penling.dart';
import 'package:sitearound/ulility/color_style.dart';

class SiteAroundHomePage extends StatefulWidget {
  @override
  _MyHomeMenuPageState createState() => _MyHomeMenuPageState();
}

var tstyle = TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 50);

class _MyHomeMenuPageState extends State<SiteAroundHomePage> {
  int _index = 0;
  List<Widget> pageWiget = <Widget>[
    MyHomeMenuMenuPage(),
    MyPending(),
    // MyPending(),
    MyMore(),
  ];
  PageController controller = PageController();

  var iconData = <IconData>[
    Icons.home,
    // Icons.list_alt,
    Icons.report,
    Icons.more_horiz,
  ];

  var iconText = <Widget>[
    Text('Home', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('Pending', style: TextStyle(color: Colors.grey, fontSize: 12)),
    // Text('Pending', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('More', style: TextStyle(color: Colors.grey, fontSize: 12)),
  ];

  var indicatorColors = <Color>[
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          double navBarHeight = scaledHeight(context, 85);
          return Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  onPressed: () async {
                    // SharedPreferences preferences =
                    //     await SharedPreferences.getInstance();
                    // preferences.clear();
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => LoginScreen(),
                    //   ),
                    //   (route) => false);
                  },
                  icon: Icon(
                    FontAwesomeIcons.userCircle,
                    size: 25,
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
              elevation: 0,
            ),
            body: PageView.builder(
                itemCount: 3,
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
                animationCurve: Curves.decelerate,
                animationType: AnimationType.shrinkOutIn,
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
