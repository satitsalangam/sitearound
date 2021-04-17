import 'package:flutter/material.dart';
import 'package:sitearound/ulility/sliverAppBarDelegate.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';
import 'components/RFIInformation.dart';
import 'components/RFIquestion.dart';
import 'components/RFIworkflow.dart';

class RFIInfo extends StatefulWidget {
  const RFIInfo(
      {Key key,
      this.id,
      this.title,
      this.docCode,
      this.assignments,
      this.dueDate,
      this.process,
      this.status})
      : super(key: key);
  final int id, process, status;
  final title;
  final docCode;
  final assignments;
  final DateTime dueDate;
  @override
  _RFIInfoState createState() => _RFIInfoState();
}

class _RFIInfoState extends State<RFIInfo> {
  List<Tab> _tabs = [];
  int index = 0;
  int id, process, status,assignments;
  DateTime dueDate;

  String docCode, title;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    id = widget.id;
    title = widget.title;
    assignments = widget.assignments;
    docCode = widget.docCode;
    dueDate = widget.dueDate;
    process = widget.process;
    status = widget.status;
    _tabs = [
      Tab(text: "Information"),
      Tab(text: "Workflow"),
      // Tab(text: "Question"),
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
                    expandedHeight: 180,
                    backgroundColor: Colors.orange[50],
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      background: Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 10, top: 55),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: size.width * 0.9,
                                      child: Text(title, style: bl16Style),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width * 0.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    showBoxDetail(
                                        size, 'Document Code', docCode),
                                    showBoxDetail(
                                        size, 'Assignments', '$assignments คน'),
                                    showBoxDetail(size, 'Due Date',
                                        '${dueDate.day}-${dueDate.month}-${dueDate.year}'),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, left: 20),
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
                RFIInformation(id: id),
                RFIWorkflow(id: id),
                // RFIworkflow(id: id),
                // RFIQuestion(),
              ])),
        ),
      ),
    );
  }
}
