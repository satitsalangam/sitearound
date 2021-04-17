import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/pendingModel.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class SitearoundPending extends StatefulWidget {
  @override
  _SitearoundPendingState createState() => _SitearoundPendingState();
}

class _SitearoundPendingState extends State<SitearoundPending> {
  final _scrollController = ScrollController();
  final _scrollThrehold = 10;
  int showItem = 10;
  EndPoints endpoints = EndPoints();

  @override
  void initState() {
    _scrollController.addListener(() async {
      final maxScroll = _scrollController.position.maxScrollExtent;
      print('Max Scroll :$maxScroll');
      final currentScroll = _scrollController.position.pixels;
      print("CurrentScroll:$currentScroll");
      if (maxScroll - currentScroll <= _scrollThrehold) {
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          showItem += 10;
        });
      }
    });
    super.initState();
  }

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
      appBar: appBar(context, 'Pending'),
      body: Container(
        child: FutureBuilder<PendingModel>(
            future: getmyPendList(),
            builder: (context, AsyncSnapshot<PendingModel> snapshot) {
              if (snapshot.hasError) {
              } else if (snapshot.hasData) {
                return ListView.builder(
                    controller: _scrollController,
                    itemCount: (showItem >= snapshot.data.result.length)
                        ? snapshot.data.result.length
                        : showItem,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          Padding(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                          ),
                          (showItem - (index + 1) == 0)
                              ? CircularProgressIndicator()
                              : Container()
                        ],
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
