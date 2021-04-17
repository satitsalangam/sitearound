import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/docsubmittal_Model.dart';
import 'package:sitearound/UI/Submittal/components/sub_workflow.dart';
import 'package:sitearound/ulility/sliverAppBarDelegate.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

import 'components/sub_Information.dart';

class SubmittalInfo extends StatefulWidget {
  SubmittalInfo(
      {Key key,
      this.id,
      this.dueDate,
      this.docCode,
      this.title,
      this.process,
      this.status,
      this.assignments})
      : super(key: key);
  final int id, process, status, assignments;

  final String title, docCode;
  final DateTime dueDate;

  @override
  _SubmittalInfoState createState() => _SubmittalInfoState();
}

class _SubmittalInfoState extends State<SubmittalInfo> {
  List<Tab> _tabs = [];
  int index = 0;
  int id, status, process, assignments;
  DateTime dueDate;
  List<String> ballCode = [];
  String docCode, title;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    print(widget.id);
    title = widget.title;
    id = widget.id;
    docCode = widget.docCode;
    dueDate = widget.dueDate;
    process = widget.process;
    status = widget.status;
    assignments = widget.assignments;
    _tabs = [
      Tab(text: "Information"),
      Tab(text: "Workflow"),
    ];
  }

  EndPoints endpoints = EndPoints();
  SharedPreferences prefs;

  Future<DocSubmittalModel> getDocSubmitInfoPageList() async {
    prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.submittalsDetail
          .replaceAll(':id', widget.id.toString())
          .replaceAll(
            ':project_name',
            prefs.getString('project_name'),
          ),
    );
    var decoded = utf8.decode(result.bodyBytes);
    DocSubmittalModel submittalsDetail = docSubmittalModelFromJson(decoded);
    print(submittalsDetail);
    print(result);
    return submittalsDetail;
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
                                  child: Text(
                                    title,
                                    style: bl18Style,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: size.width * 0.9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  showBoxDetail(size, 'Document Code', docCode),
                                  showBoxDetail(
                                      size, 'Assignments', '$assignments คน'),
                                  showBoxDetail(size, 'Due Date',
                                      '${dueDate.day}-${dueDate.month}-${dueDate.year}'),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, left: 15),
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
              SubmittalInformation(submittalId: id),
              SubmittalWorkflow(submittalId: id),
            ]),
          ),
        ),
      ),
    );
  }

  Widget showbtndelete(Size size, onPressed) {
    return Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 15, top: 15),
        child: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onPressed,
          color: Colors.red,
        ));
  }
}
