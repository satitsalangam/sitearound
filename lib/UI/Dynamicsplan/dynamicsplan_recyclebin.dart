import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/dynamic_Model.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

import 'dynamicsplan_info.dart';

class DynamicsPlanRecycleBin extends StatefulWidget {
  @override
  _DynamicsPlanRecycleBinState createState() => _DynamicsPlanRecycleBinState();
}

class _DynamicsPlanRecycleBinState extends State<DynamicsPlanRecycleBin> {
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

  Future<DynamicModel> getDynamicPlanList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.dynamicPlanListRecycleBin.replaceAll(
        ':project_name',
        prefs.getString('project_name'),
      ),
    );
    var decoded = utf8.decode(result.bodyBytes);
    DynamicModel dynamicPlanList = dynamicModelFromJson(decoded);
    print('dynamic>>>>>${result.body}');
    print('decoded>>>>>$decoded');
    print(result);
    return dynamicPlanList;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: appBar(context, 'DynamicsPlan'),
      body: FutureBuilder<DynamicModel>(
          future: getDynamicPlanList(),
          builder: (context, AsyncSnapshot<DynamicModel> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.hasError);
            } else if (snapshot.hasData) {
              return ListView.builder(
                  controller: _scrollController,
                  itemCount: (showItem >= snapshot.data.result.length)
                      ? snapshot.data.result.length
                      : showItem,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DynamicsPlanInfo(
                                id: snapshot.data.result[index].id,
                                title: snapshot.data.result[index].title,
                                docCode:
                                    snapshot.data.result[index].documentCode,
                                startDate:
                                    snapshot.data.result[index].startDate,
                                status: snapshot.data.result[index].status,
                                process: snapshot.data.result[index].process,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Card(
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
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8,
                                            left: 8,
                                            right: 8,
                                            bottom: 4),
                                        child: Text(
                                          '${snapshot.data.result[index].title}',
                                          style: bl16Style,
                                        ),
                                      ),
                                      showBoxDetail(size, 'Document code',
                                          '${snapshot.data.result[index].documentCode}'),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Container(
                                              width: size.width * 0.3,
                                              child: Text(
                                                'Ball in Cournt',
                                                style: blw14Style,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 4),
                                            child: Text(':'),
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.47,
                                                child: Text(
                                                  snapshot.data.result[index]
                                                          .ballInCourt.isEmpty
                                                      ? '-'
                                                      : snapshot
                                                                  .data
                                                                  .result[index]
                                                                  .ballInCourt
                                                                  .length >
                                                              1
                                                          ? '${snapshot.data.result[index].ballInCourt.length} คน'
                                                          : '${snapshot.data.result[index].ballInCourt[0]}',
                                                  style: bl14Style,
                                                  overflow: TextOverflow.fade,
                                                  softWrap: true,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      showBoxDetail(size, 'Start Date',
                                          '${snapshot.data.result[index].startDate.day}-${snapshot.data.result[index].startDate.month}-${snapshot.data.result[index].startDate.year}'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            showbtnProcess(size,
                                                '${snapshot.data.result[index].process}'),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            showbtnStatus(size,
                                                '${snapshot.data.result[index].status}'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            (showItem - (index + 1) == 0)
                                ? CircularProgressIndicator()
                                : Container()
                          ],
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
