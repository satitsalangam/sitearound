import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/projectDetail.dart';
import 'package:sitearound/ulility/text_style.dart';

class ProjectInformation extends StatefulWidget {
  @override
  _ProjectInformationState createState() => _ProjectInformationState();
}

class _ProjectInformationState extends State<ProjectInformation> {
  EndPoints endpoints = EndPoints();
  SharedPreferences prefs;
  Future<ProjectDetail> getInformationList() async {
    prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.projectDetail.replaceAll(
        ':project_name',
        prefs.getString('project_name'),
      ),
    );
    var decoded = utf8.decode(result.bodyBytes);
    ProjectDetail projectDetail = projectDetailFromJson(decoded);
    print('dynamic>>>>>${result.body}');
    print('decoded>>>>>$decoded');
    print(result);
    return projectDetail;
  }

  Future<Map<String, dynamic>> getImage(String path) async {
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    print('Token:$token');
    print("Path:$path");
    CustomClient client = CustomClient();
    var result = await client.getImage(
      path,
    );
    print('Result:${result.body}');
    Map<String, dynamic> imageUrl;
    imageUrl = {'imageUrl': result.body, 'token': token};
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: FutureBuilder<ProjectDetail>(
            future: getInformationList(),
            builder: (context, AsyncSnapshot<ProjectDetail> snapshot) {
              if (snapshot.hasError) {
                print('haserror${snapshot.hasError}');
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: FutureBuilder<Map<String, dynamic>>(
                            future: getImage(snapshot.data.image),
                            builder: (context,
                                AsyncSnapshot<Map<String, dynamic>>
                                    snapshotData) {
                              if (snapshotData.hasData) {
                                return Container(
                                  child: Image(
                                    image: NetworkImage(
                                        snapshotData.data['imageUrl']),
                                    fit: BoxFit.cover,
                                    height: 250,
                                    width: size.width * 1,
                                  ),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              '${snapshot.data.name}',
                              style: bl22Style,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      showBoxText(size, snapshot, 'Project Type',
                          '${snapshot.data.projectType.name}'),
                      Divider(
                        thickness: 1,
                      ),
                      showBoxText(
                          size, snapshot, 'Code', '${snapshot.data.code}'),
                      Divider(
                        thickness: 1,
                      ),
                      showBoxText(size, snapshot, 'Area (Sq.m)',
                          '${snapshot.data.squareFeet}'),
                      Divider(
                        thickness: 1,
                      ),
                      showBoxText(size, snapshot, 'Value (THB)',
                          '${snapshot.data.estimatedValue}'),
                      Divider(
                        thickness: 1,
                      ),
                      showBoxText(size, snapshot, 'Start Date',
                          '${snapshot.data.startDate.day}-${snapshot.data.startDate.month}-${snapshot.data.startDate.year}'),
                      Divider(
                        thickness: 1,
                      ),
                      showBoxText(size, snapshot, 'Completion  Date',
                          '${snapshot.data.completionDate.day}-${snapshot.data.completionDate.month}-${snapshot.data.completionDate.year}'),
                      Divider(
                        thickness: 1,
                      ),
                      showBoxText(size, snapshot, 'Construction',
                          '${snapshot.data.process.name}'),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  Widget showBoxText(
      Size size, AsyncSnapshot<ProjectDetail> snapshot, title, detail) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: size.width * 0.37,
              child: Text(
                title,
                style: bl14Style,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text(':'),
          ),
          Container(
            width: size.width * 0.5,
            child: Text(
              detail,
              overflow: TextOverflow.ellipsis,
              style: bl14Style,
            ),
          ),
        ],
      ),
    );
  }
}
