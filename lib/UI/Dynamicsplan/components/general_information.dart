import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/dynamic_detail.dart';
import 'package:sitearound/ulility/style.dart';

import 'package:sitearound/ulility/text_style.dart';

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({Key key, this.id}) : super(key: key);
  final int id;
  @override
  _GeneralInformationState createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<DynamicDetail>(
          future: getDynamicDetial(),
          builder: (context, AsyncSnapshot<DynamicDetail> snapshot) {
            if (snapshot.hasError) {
              print('error>>>${snapshot.hasError}');
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      showText(snapshot, 'Subject', '${snapshot.data.title}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Start Due Date',
                          '${snapshot.data.startDate.day}-${snapshot.data.startDate.month}-${snapshot.data.startDate.year}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Document Code',
                          '${snapshot.data.documentCode}'),
                      Divider(
                        thickness: 1,
                      ),
                      // showText(snapshot, 'Completion Date', '-'),
                      // Divider(
                      //   thickness: 1,
                      // ),
                      showText(snapshot, 'Created at',
                          '${snapshot.data.createdAt.day}-${snapshot.data.createdAt.month}-${snapshot.data.createdAt.year}'),
                      Divider(
                        thickness: 1,
                      ),
                      showText(snapshot, 'Created by',
                          '${snapshot.data.createdBy.fullName}'),
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

  Widget showText(AsyncSnapshot<DynamicDetail> snapshot, title, detail) {
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
            ),
          ),
        ],
      ),
    );
  }
}
