import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/project_Model.dart';
import 'package:http/http.dart' as http;
import 'package:sitearound/UI/homePage/sitearound_homepage.dart';
import 'package:sitearound/ulility/text_style.dart';

class SitearoundImage extends StatefulWidget {
  @override
  _SitearoundImageState createState() => _SitearoundImageState();
}

class _SitearoundImageState extends State<SitearoundImage> {
  EndPoints endpoints = EndPoints();
  SharedPreferences prefs;

  Future<ProjectModel> getProjectList() async {
    prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.projectList,
    );
    var decoded = utf8.decode(result.bodyBytes);
    ProjectModel projectList = projectModelFromJson(decoded);
    // print('projectList>>>>>${projectList}');
    // print("result>>>>>>$result");
    return projectList;
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
      body: FutureBuilder<ProjectModel>(
          future: getProjectList(),
          builder: (context, AsyncSnapshot<ProjectModel> snapshot) {
            if (snapshot.hasError) {
            } else if (snapshot.hasData) {
              print(snapshot.data.results);
              return ListView.builder(
                  itemCount: snapshot.data.results.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            prefs.setString('project_name',
                                snapshot.data.results[index].name);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SiteAroundHomePage(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: FutureBuilder<Map<String, dynamic>>(
                                    future: getImage(
                                        snapshot.data.results[index].image),
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
                                showTitle(
                                  size,
                                  snapshot,
                                  index,
                                  snapshot.data.results[index].name,
                                ),
                                showDetail(
                                    size,
                                    snapshot,
                                    index,
                                    'Project code',
                                    snapshot.data.results[index].code),
                                showDetail(
                                    size,
                                    snapshot,
                                    index,
                                    'Project type',
                                    snapshot
                                        .data.results[index].projectType.name),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: size.width * 0.3,
                                        child: Text(
                                          'Date',
                                          style: bl14Style,
                                        ),
                                      ),
                                      snapshot.data.results[index].startDate ==
                                              null
                                          ? Text('-')
                                          : Text(
                                              '${snapshot.data.results[index].startDate.day}/${snapshot.data.results[index].startDate.month}/${snapshot.data.results[index].startDate.year}',
                                              style: bl14Style,
                                            )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget showDetail(Size size, AsyncSnapshot<ProjectModel> snapshot, int index,
      title, detail) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 20, bottom: 5),
      child: Row(
        children: [
          Container(
            width: size.width * 0.3,
            child: Text(
              title,
              style: bl14Style,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.52,
                child: Text(
                  detail,
                  style: bl14Style,
                  softWrap: false,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget showTitle(
      Size size, AsyncSnapshot<ProjectModel> snapshot, int index, title) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
      child: Row(
        children: [
          Container(
            width: size.width * 0.9,
            child: Text(
              title,
              style: bl18Style,
            ),
          ),
        ],
      ),
    );
  }
}
