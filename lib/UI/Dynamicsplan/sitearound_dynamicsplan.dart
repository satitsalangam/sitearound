import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sitearound/UI/Dynamicsplan/dynamicsplan_item.dart';
import 'package:sitearound/ulility/sliverAppBarDelegate.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

import 'components/dynamics_search.dart';
import 'dynamicsplan_draft.dart';
import 'dynamicsplan_recyclebin.dart';

class SitearoundDynamicsPlan extends StatefulWidget {
  @override
  _SitearoundDynamicsPlanState createState() => _SitearoundDynamicsPlanState();
}

class _SitearoundDynamicsPlanState extends State<SitearoundDynamicsPlan>
    with SingleTickerProviderStateMixin {
  List<Tab> _tabs = [];
  int index = 0;
  TabController _tabController;
  String text;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(text: "Items"),
      Tab(text: "Draft"),
      Tab(text: "Recycle Bin"),
    ];
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  elevation: 4,
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
                    'DynamicsPlan',
                    style: bl22Style,
                  ),
                  pinned: true,
                  centerTitle: true,
                  // toolbarHeight: size.height * 0.05,
                  expandedHeight: size.height * 0.18,
                  backgroundColor: Colors.orange[50],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 10, top: 75),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: size.width * 0.7,
                                    child: TextFormField(
                                      onChanged: (value) => text = value,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        prefixIconConstraints: BoxConstraints(
                                          maxHeight: 32,
                                          maxWidth: 32,
                                        ),
                                        hintText: 'Search',
                                        hintStyle: grey14Style,
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DynamicsSearch(
                                                    text: text,
                                                    tabbar:
                                                        _tabController.index),
                                          ),
                                        );
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: size.width * 0.2,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey[200],
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.blueGrey[200],
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 35,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 190, 77, 1),
                                border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(255, 190, 77, 1),
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child:
                                        Image.asset('assets/icons/filter.png'),
                                  ),
                                  Text(
                                    'Filter',
                                    style: wh16Style,
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
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
            body: TabBarView(children: [
              DynamicsPlanItems(),
              DynamicsPlanDraft(),
              DynamicsPlanRecycleBin(),
            ]),
          ),
        ),
      ),
    );
  }
}
