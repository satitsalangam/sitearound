import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/rfi_Model.dart';
import 'package:sitearound/UI/RFI/components/RFISearch.dart';
import 'package:sitearound/UI/RFI/rfi_items.dart';
import 'package:sitearound/ulility/sliverAppBarDelegate.dart';
import 'package:sitearound/ulility/text_style.dart';

import 'rfi_draft.dart';
import 'rfi_recyclebin.dart';

class SitearoundRFI extends StatefulWidget {
  @override
  _SitearoundRFIState createState() => _SitearoundRFIState();
}

class _SitearoundRFIState extends State<SitearoundRFI>
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
                    'RFI',
                    style: bl24Style,
                  ),
                   pinned: true,
                  centerTitle: true,
                  expandedHeight: size.height * 0.18,
                  backgroundColor: Colors.orange[50],
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(top: 5),
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
                                            builder: (context) => RFISearch(
                                                text: text,
                                                tabbar: _tabController.index),
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
                      controller: _tabController,
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
            body: TabBarView(controller: _tabController, children: [
              RFIItems(),
              RFIDraft(),
              RFIRecycleBin(),
            ]),
          ),
        ),
      ),
    );
  }
}
