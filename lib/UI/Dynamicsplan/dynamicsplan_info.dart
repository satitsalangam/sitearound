import 'package:flutter/material.dart';
import 'package:sitearound/UI/Dynamicsplan/components/general_information.dart';
import 'package:sitearound/ulility/sliverAppBarDelegate.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

import 'components/dynamics_workflow.dart';

class DynamicsPlanInfo extends StatefulWidget {
  DynamicsPlanInfo({
    Key key,
    this.id,
    this.startDate,
    this.docCode,
    this.title,
    this.process,
    this.status,
  }) : super(key: key);
  final int id, process, status;

  final String title, docCode;
  final DateTime startDate;

  @override
  _DynamicsPlanInfoState createState() => _DynamicsPlanInfoState();
}

class _DynamicsPlanInfoState extends State<DynamicsPlanInfo> {
  List<Tab> _tabs = [];
  int index = 0;
  int id, status, process;
  DateTime startDate;

  String docCode, title;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    print(widget.id);
    title = widget.title;
    id = widget.id;
    docCode = widget.docCode;
    startDate = widget.startDate;
    process = widget.process;
    status = widget.status;
    _tabs = [
      Tab(text: "General Information"),
      Tab(text: "Workflow"),
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
                  pinned: true,
                  expandedHeight: size.height * 0.25,
                  backgroundColor: Colors.orange[50],
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(top: 5),
                    centerTitle: true,
                    background: Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 10, top: 65),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width * 0.9,
                                  child: Text(title, style: bl16Style),
                                ),
                              ],
                            ),
                            Container(
                              width: size.width * 0.9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  showBoxDetail(size, 'Document Code', docCode),
                                  showBoxDetail(size, 'Start Date',
                                      '${startDate.day}-${startDate.month}-${startDate.year}'),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        showbtnProcess(size, '$process'),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        showbtnStatus(size, '$status'),
                                      ],
                                    ),
                                  ),
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
              GeneralInformation(
                id: id,
              ),
              DynamicsPlanWorkflow(
                id: id,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
