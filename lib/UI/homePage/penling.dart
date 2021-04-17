import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/pendingModel.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class MyPending extends StatefulWidget {
  @override
  _MyPendingState createState() => _MyPendingState();
}

class _MyPendingState extends State<MyPending> {
  EndPoints endpoints = EndPoints();

  Future<PendingModel> getmyPendList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.myPendingDoc.replaceAll(
        ':project_name',
        prefs.getString('project_name'),
      ),
    );
    var decoded = utf8.decode(result.bodyBytes);
    PendingModel myPendingDoc = pendingModelFromJson(decoded);
    print(result.body);
    return myPendingDoc;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: FutureBuilder<PendingModel>(
            future: getmyPendList(),
            builder: (context, AsyncSnapshot<PendingModel> snapshot) {
              if (snapshot.hasError) {
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.result.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, bottom: 10),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // color: Colors.red,
                                          child: SizedBox(
                                            width: size.width * 0.55,
                                            child: Text(
                                              '${snapshot.data.result[index].title}',
                                              style: bl16Style,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        showbtnStatus(size,
                                            '${snapshot.data.result[index].status}'),
                                      ],
                                    ),
                                  ),
                                  showBoxDetail(size, 'Document Code',
                                      '${snapshot.data.result[index].documentCode}'),
                                  showBoxDetail(size, 'Item type',
                                      '${snapshot.data.result[index].state}'),
                                  showBoxDetail(size, 'Role',
                                      '${snapshot.data.result[index].userInDocument}'),
                                  showBoxDetail(size, 'Due Date',
                                      '${snapshot.data.result[index].dueDate.day}-${snapshot.data.result[index].dueDate.month}-${snapshot.data.result[index].dueDate.year}'),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
