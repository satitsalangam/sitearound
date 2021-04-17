import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/docRFI_Model.dart';
import 'package:sitearound/ulility/text_style.dart';

class RFIWorkflow extends StatefulWidget {
  const RFIWorkflow({Key key, this.id}) : super(key: key);
  final int id;
  @override
  _RFIWorkflowState createState() => _RFIWorkflowState();
}

class _RFIWorkflowState extends State<RFIWorkflow> {
  EndPoints endpoints = EndPoints();
  Future<DocRfiModel> getDocRfiInfoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.docDetail.replaceAll(':id', widget.id.toString()).replaceAll(
            ':project_name',
            prefs.getString('project_name'),
          ),
    );
    var decoded = utf8.decode(result.bodyBytes);
    DocRfiModel docDetailRfi = docRfiModelFromJson(decoded);
    print(docDetailRfi);
    print(result.body);
    return docDetailRfi;
  }

  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('id>>>${widget.id}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder<DocRfiModel>(
          future: getDocRfiInfoList(),
          builder: (context, AsyncSnapshot<DocRfiModel> snapshot) {
            if (snapshot.hasError) {
              print('error>>>${snapshot.hasError}');
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 10,
                ),
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount: snapshot.data.assignments.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          child: Column(
                            children: [
                              index == 0
                                  ? Row(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  margin: EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                ),
                                                Container(
                                                  width: 2,
                                                  height: 40,
                                                  color: Colors.green,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(
                                            // color: Colors.orange,
                                            height: 60,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Create order',
                                                  style: bl22Style,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.check_circle,
                                                          color: Colors.green,
                                                        ),
                                                        Text(
                                                            '${snapshot.data.user.fullName}',
                                                            style: bl14Style),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${snapshot.data.createdAt.day}-${snapshot.data.createdAt.month}-${snapshot.data.createdAt.year}',
                                                          style: bl14Style,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 2,
                                        height: 30,
                                        color: index == 0
                                            ? Colors.green
                                            : Colors.black,
                                      ),
                                      snapshot.data.state == 0 &&
                                              snapshot.data.process == 2
                                          ? snapshot.data.order > index
                                              ? showbtngreen()
                                              : showbtnbluegrey()
                                          : snapshot.data.process == 4
                                              ? showbtngreen()
                                              : showbtnbluegrey(),
                                      Container(
                                        width: 2,
                                        height: 50,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      // color: Colors.yellow,
                                      height: 100,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Step${index + 1}',
                                                style: bl22Style,
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: snapshot
                                                .data.assignments[index]
                                                .map(
                                                  (e) => Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          e.status.toString() ==
                                                                  'null'
                                                              ? Icon(
                                                                  Icons.cancel,
                                                                  color: Colors
                                                                      .red,
                                                                )
                                                              : Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Colors
                                                                      .green,
                                                                ),
                                                          Text(
                                                            '${e.fullName}',
                                                            style: bl12Style,
                                                          ),
                                                        ],
                                                      ),
                                                      e.sendDate.toString() ==
                                                              'null'
                                                          ? Text(
                                                              'Responded Date',
                                                              style: bl12Style,
                                                            )
                                                          : Text(
                                                              '${e.sendDate.day}-${e.sendDate.month}-${e.sendDate.year}',
                                                              style: bl12Style,
                                                            ),
                                                    ],
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              index == snapshot.data.assignments.length - 1
                                ? Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 2,
                                            height: 35,
                                            color: Colors.black,
                                          ),
                                          snapshot.data.process == 4
                                              ? showbtngreen()
                                              : showbtnbluegrey()
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Approved',
                                                  style: bl22Style),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      snapshot.data.process == 4
                                                          ? Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  Colors.green,
                                                            )
                                                          : Icon(
                                                              Icons.cancel,
                                                              color: Colors.red,
                                                            ),
                                                      Text(
                                                        '${snapshot.data.manager.fullName}',
                                                        style: bl12Style,
                                                      ),
                                                    ],
                                                  ),
                                                  snapshot.data.managerDate
                                                              .toString() ==
                                                          'null'
                                                      ? Text(
                                                          'Responded Date',
                                                          style: bl12Style,
                                                        )
                                                      : Text(
                                                          '${snapshot.data.managerDate.day}-${snapshot.data.managerDate.month}-${snapshot.data.managerDate.year}',
                                                          style: bl14Style,
                                                        )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            ],
                          ),
                        );
                      }),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget showbtnbluegrey() {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blueGrey[300],
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  Widget showbtngreen() {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
