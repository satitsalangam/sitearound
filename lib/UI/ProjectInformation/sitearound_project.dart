import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/UI/ProjectInformation/components/project_information.dart';
import 'package:sitearound/UI/ProjectInformation/components/project_location.dart';
import 'package:sitearound/ulility/sliverAppBarDelegate.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class SitearoundProject extends StatefulWidget {
  @override
  _SitearoundProjectState createState() => _SitearoundProjectState();
}

class _SitearoundProjectState extends State<SitearoundProject> {
  List<Tab> _tabs = [];
  int index = 0;

  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(text: "Information"),
      Tab(text: "Location"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  elevation: 8,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.orange,
                      size: 25.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(
                    'Project Name',
                    style: bl22Style,
                  ),
                  pinned: true,
                  centerTitle: true,
                  // toolbarHeight: size.height * 0.05,
                  // expandedHeight: size.height * 0.15,
                  backgroundColor: Colors.orange[50],
                  flexibleSpace: FlexibleSpaceBar(),
                ),
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    TabBar(
                      onTap: (index) {
                        setState(() {
                          index = index;
                        });
                        controller.jumpToPage(index);
                      },
                      tabs: _tabs,
                      indicatorWeight: 2,
                      labelColor: Colors.orange,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.orange[800],
                    ),
                  ),
                  pinned: true,
                )
              ];
            },
            body: TabBarView(children: [
              ProjectInformation(),
              ProjectLocation(),
            ]),
          ),
        ),
      ),
    );
  }
}
