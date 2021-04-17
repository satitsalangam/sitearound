import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/list_Location.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class SitearoundLocation extends StatefulWidget {
  @override
  _SitearoundLocationState createState() => _SitearoundLocationState();
}

class _SitearoundLocationState extends State<SitearoundLocation> {
  EndPoints endpoints = EndPoints();
  SharedPreferences prefs;
  Future<ListLocation> getListlocation() async {
    prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.locationURL.replaceAll(
        ':project_name',
        prefs.getString('project_name'),
      ),
    );
    var decoded = utf8.decode(result.bodyBytes);
    ListLocation listLocation = listLocationFromJson(decoded);
    print('dynamic>>>>>${result.body}');
    print('decoded>>>>>$decoded');
    print(result);
    return listLocation;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, 'Location'),
      body: Container(
        child: FutureBuilder(
            future: getListlocation(),
            builder: (context, AsyncSnapshot<ListLocation> snapshot) {
              if (snapshot.hasError) {
                print('hasError${snapshot.hasError}');
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.result.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 10, bottom: 20),
                          child: Column(
                            children: [
                              showTextBox(size, snapshot, index, 'Name',
                                  '${snapshot.data.result[index].name}'),
                              showTextBox(size, snapshot, index, 'DisplayName',
                                  '${snapshot.data.result[index].displayName}'),
                              showTextBox(
                                  size,
                                  snapshot,
                                  index,
                                  'Parent',
                                  snapshot.data.result[index]
                                              .parentContextData ==
                                          null
                                      ? 'N/A'
                                      : '${snapshot.data.result[index].parentContextData.name}'),
                              Row(
                                children: [],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  Widget showTextBox(Size size, AsyncSnapshot<ListLocation> snapshot, int index,
      title, detail) {
    return Row(
      children: [
        Container(
          width: size.width * 0.3,
          child: Text(
            title,
            style: bl14Style,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Text(':'),
        ),
        Text(
          detail,
          style: bl14Style,
        ),
      ],
    );
  }
}
