import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/dynamic_detail.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class DynamicsPlanWorkflow extends StatefulWidget {
  const DynamicsPlanWorkflow({Key key, this.id}) : super(key: key);
  final int id;
  @override
  _DynamicsPlanWorkflowState createState() => _DynamicsPlanWorkflowState();
}

class _DynamicsPlanWorkflowState extends State<DynamicsPlanWorkflow> {
  EndPoints endpoints = EndPoints();

  Future<DynamicDetail> getDynamicDetial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.dynamicPlanDetail
          .replaceAll(':id', widget.id.toString())
          .replaceAll(
            ':project_name',
            prefs.getString('project_name'),
          ),
    );
    var decoded = utf8.decode(result.bodyBytes);
    DynamicDetail dynamicDetail = dynamicDetailFromJson(decoded);
    print(dynamicDetail);
    print(result);
    return dynamicDetail;
  }

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
      body: FutureBuilder<DynamicDetail>(
          future: getDynamicDetial(),
          builder: (context, AsyncSnapshot<DynamicDetail> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.hasError);
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 10),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, left: 8, top: 8, bottom: 4),
                                  child: Text(
                                    '${snapshot.data.documents[index].title}',
                                    style: bl16Style,
                                  ),
                                ),
                                showBoxDetail(
                                    size,
                                    'Manager',
                                    snapshot.data.documentCode[index] == null
                                        ? '-'
                                        : '${snapshot.data.documents[index].manager.fullName}'),
                                showBoxDetail(
                                    size,
                                    'Document code',
                                    snapshot.data.documentCode[index] == null
                                        ? '-'
                                        : '${snapshot.data.documents[index].documentCode}'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: size.width * 0.3,
                                        child: Text(
                                          'Ball in Count ',
                                          style: blw14Style,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: Text(':'),
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: snapshot.data.documents
                                              .map((e) => Container(
                                                    width: size.width * 0.47,
                                                    child: Text(
                                                      '${e.ballInCourt}.'
                                                          .replaceAll('[', '')
                                                          .replaceAll(']', ''),
                                                      style: bl14Style,
                                                    ),
                                                  ))
                                              .toList())
                                    ],
                                  ),
                                ),
                                showBoxDetail(size, 'Due Date',
                                    '${snapshot.data.documents[index].dueDate.day}-${snapshot.data.documents[index].dueDate.month}-${snapshot.data.documents[index].dueDate.year}'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: size.width * 0.3,
                                        child: Text(
                                          'Assignments',
                                          style: blw14Style,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 4),
                                        child: Text(':'),
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: snapshot
                                              .data.documents[index].assignments
                                              .map((e) => Column(
                                                  children: e
                                                      .map(
                                                        (s) => Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            s.fullName == null
                                                                ? Text(
                                                                    '-',
                                                                    style:
                                                                        bl14Style,
                                                                  )
                                                                : Text(
                                                                    s.fullName,
                                                                    style:
                                                                        bl14Style,
                                                                  ),
                                                          ],
                                                        ),
                                                      )
                                                      .toList()
                                                  // e.fullName.toString() ==
                                                  //             'null' ||
                                                  //         e.fullName.isEmpty
                                                  //     ? Text(
                                                  //         'N/A',
                                                  //         style: bl14Style,
                                                  //       )
                                                  //     : Container(
                                                  //         width:
                                                  //             size.width *
                                                  //                 0.5,
                                                  //         child: Text(
                                                  //           e.fullName,
                                                  //           style:
                                                  //               bl14Style,
                                                  //           overflow:
                                                  //               TextOverflow
                                                  //                   .ellipsis,
                                                  //           softWrap: false,
                                                  //         ),
                                                  //       ),

                                                  ))
                                              .toList()),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 10, left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      showbtnProcess(size,
                                          '${snapshot.data.documents[index].process}'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      showbtnStatus(size,
                                          '${snapshot.data.documents[index].status}'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
