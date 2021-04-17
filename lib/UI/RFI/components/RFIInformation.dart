import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/docRFI_Model.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class RFIInformation extends StatefulWidget {
  const RFIInformation({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _RFIInformationState createState() => _RFIInformationState();
}

class _RFIInformationState extends State<RFIInformation> {
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
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      showText(snapshot, 'Discipline',
                          '${snapshot.data.disciplineContextData.name}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Subject', '${snapshot.data.title}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Document Code',
                          '${snapshot.data.documentCode}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Due Date',
                          '${snapshot.data.dueDate.day}-${snapshot.data.dueDate.month}-${snapshot.data.dueDate.year}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Created By',
                          '${snapshot.data.user.fullName}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Created At',
                          '${snapshot.data.createdAt.day}-${snapshot.data.createdAt.month}-${snapshot.data.createdAt.year}'),
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                      
                        children: [
                          Container(
                            width: size.width*0.4,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: Text('Task Status', style: blw14Style),
                            ),
                          ),
                          showbtnStatus(size, '${snapshot.data.status}')
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              width: size.width*0.3,
                              child: Text(
                                'Distribution List',
                                style: blw14Style,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: snapshot.data.distributionList
                                .map((e) => Container(
                                  width: size.width*0.5,
                                  child: Text(
                                        e.fullName,
                                        style: bl14Style,
                                      ),
                                ))
                                .toList(),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'RFI Manager',
                          '${snapshot.data.manager.fullName}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'RFI Manager Due Date',
                          '${snapshot.data.managerDueDate.day}-${snapshot.data.managerDueDate.month}-${snapshot.data.managerDueDate.year}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Cost Impact',
                          '${snapshot.data.costImpact}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Schedule Impact',
                          '${snapshot.data.scheduleImpact}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(
                          snapshot, 'Location', '${snapshot.data.location}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Drawing Number',
                          '${snapshot.data.drawingNumber}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(
                          snapshot,
                          'Responsible Contractor',
                          snapshot.data.company.toString() == 'null'
                              ? '-'
                              : snapshot.data.company.name),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Specification',
                          '${snapshot.data.specSection}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Received From',
                          '${snapshot.data.receivedFromList}'),
                      Divider(
                        thickness: 1,
                      ),
                      //  showText(snapshot, 'Dynamics Plan',
                      //     '${snapshot.data.}'),
                      // Divider(
                      //   thickness: 1,
                      // ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget showText(AsyncSnapshot<DocRfiModel> snapshot, title, detail) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: size.width * 0.3, child: Text(title, style: blw14Style)),
          Container(
            width: size.width * 0.5,
            child: Text(
              detail.toString() == 'null' || detail.toString().isEmpty
                  ? '-'
                  : detail,
              style: bl14Style,overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
