import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/docsubmittal_Model.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class SubmittalInformation extends StatefulWidget {
  const SubmittalInformation({Key key, this.submittalId}) : super(key: key);
  final int submittalId;

  @override
  _SubmittalInformationState createState() => _SubmittalInformationState();
}

class _SubmittalInformationState extends State<SubmittalInformation> {
  EndPoints endpoints = EndPoints();
  SharedPreferences prefs;

  Future<DocSubmittalModel> getDocSubmitInfoPageList() async {
    prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.submittalsDetail
          .replaceAll(':id', widget.submittalId.toString())
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
  void initState() {
    print(widget.submittalId);
    // TODO: implement initState
    super.initState();
    print('idInfor>>>>>>>>>>${widget.submittalId}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<DocSubmittalModel>(
        future: getDocSubmitInfoPageList(),
        builder: (context, AsyncSnapshot<DocSubmittalModel> snapshot) {
          if (snapshot.hasError) {
            print('error>>>${snapshot.error}');
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    showText(
                        snapshot,
                        'Discipline',
                        snapshot.data.disciplineContextData.toString() == 'null'
                            ? '-'
                            : '${snapshot.data.disciplineContextData.name}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(
                        snapshot,
                        'Template',
                        snapshot.data.templateContextData.toString() == 'null'
                            ? '-'
                            : '${snapshot.data.templateContextData.name}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Subject', '${snapshot.data.title}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(
                        snapshot, 'Document Code', snapshot.data.documentCode),
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
                    showText(snapshot, 'Document Number',
                        snapshot.data.documentNumber),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Rev', '${snapshot.data.rev}'),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Process Status',
                          style: blw14Style,
                        ),
                        showbtnProcess(size, '${snapshot.data.process}')
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Task Status',
                          style: blw14Style,
                        ),
                        showbtnStatus(size, '${snapshot.data.status}')
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Distribution List', '-'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Submittal Initiator',
                        '${snapshot.data.reviewer}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Submittal Initiator Due Date',
                        '${snapshot.data.reviewDueDate.day}-${snapshot.data.reviewDueDate.month}-${snapshot.data.reviewDueDate.year}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Submittal Manager',
                        '${snapshot.data.manager.fullName}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Submittal Manager Due Date',
                        '${snapshot.data.managerDueDate.day}-${snapshot.data.managerDueDate.month}-${snapshot.data.managerDueDate.year}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(
                        snapshot, 'Cost Impact', '${snapshot.data.costImpact}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Schedule Impact',
                        '${snapshot.data.scheduleImpact}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Location', '${snapshot.data.location}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Drawing Number',
                        snapshot.data.drawingNumber),
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
                    showText(
                        snapshot,
                        'Specification',
                        snapshot.data.specification.toString() == 'null'
                            ? '-'
                            : '${snapshot.data.specification.name}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Received From',
                        '${snapshot.data.receivedFromList}'),
                    Divider(
                      thickness: 1,
                    ),
                    showText(snapshot, 'Dynamics Plan', '-'),
                    Divider(
                      thickness: 1,
                    ),
                    // ListTile(
                    //   title: Text("Files  : "),
                    //   trailing: IconButton(
                    //     icon: Icon(FontAwesomeIcons.fileAlt),
                    //     onPressed: () {},
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget showText(AsyncSnapshot<DocSubmittalModel> snapshot, title, detail) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width*0.3,
            child: Text(title, style: blw14Style)),
          Container(
            width: size.width*0.5,
            child: Text(
              detail.toString() == 'null' || detail.toString().isEmpty
                  ? '-'
                  : detail,
              style: bl14Style,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
