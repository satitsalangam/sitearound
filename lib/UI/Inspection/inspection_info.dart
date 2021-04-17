import 'package:flutter/material.dart';

import 'package:sitearound/ulility/radial_Progress.dart';
import 'package:sitearound/ulility/sliverAppBarDelegate.dart';
import 'package:sitearound/ulility/text_style.dart';

import 'components/Inspection.dart';
import 'components/edit_inspection.dart';
import 'components/information.dart';
import 'components/response.dart';

class InspectionInfo extends StatefulWidget {
  @override
  _InspectionInfoState createState() => _InspectionInfoState();
}

class _InspectionInfoState extends State<InspectionInfo> {
  List<Tab> _tabs = [];
  int index = 0;
  PageController controller = PageController();
  List<Widget> pageWiget = <Widget>[
    InformationPage(),
    InspectionPage(),
    ResponsePage(),
  ];
  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(text: "Information"),
      Tab(text: "Inspection"),
      Tab(text: "Response"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          // color: Colors.orange[50],
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
                  pinned: true,
                  expandedHeight: size.height * 0.3,
                  backgroundColor: Colors.orange[50],
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(top: 5),
                    centerTitle: true,
                    background: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 65),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width * 0.6,
                                  child: Text('Floor Inspections on 17th Floor',
                                      style: bl16Style),
                                ),
                                Container(
                                  width: size.width * 0.25,
                                  height: 30,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.0, color: Colors.blue[700]),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3, top: 3),
                                            child: Text('In Review',
                                                style: bl13Style),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RadialProgress(
                                    progress: 0.8,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: size.width * 0.6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Type       : Quality Test',
                                          style: bl14Style),
                                      Text('Location   : Building A,Room 1311',
                                          overflow: TextOverflow.fade,
                                          softWrap: true,
                                          style: bl14Style),
                                      Text('Assignees : Mister Tester',
                                          style: bl14Style),
                                      Text('Due Date  : 25/02/2021',
                                          style: bl14Style),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, bottom: 15, top: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditInspection(),
                            ),
                          );
                        },
                        child: Container(
                          width: size.width * 0.2,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: Colors.orange[700]),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.orange[700],
                                  ),
                                  Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.orange[700]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                      indicatorWeight: 3,
                      labelColor: Colors.orange,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.orange[800],
                    ),
                  ),
                  pinned: true,
                )
              ];
            },
            body: PageView.builder(
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                onPageChanged: (page) {
                  setState(() {
                    index = page;
                  });
                },
                itemBuilder: (context, position) {
                  return Container(
                    child: pageWiget[position],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
