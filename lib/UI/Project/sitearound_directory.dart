import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/user_sitearound.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class SitearoundDirectory extends StatefulWidget {
  @override
  _SitearoundDirectoryState createState() => _SitearoundDirectoryState();
}

class _SitearoundDirectoryState extends State<SitearoundDirectory> {
  EndPoints endpoints = EndPoints();
  SharedPreferences prefs;

  Future<UserSitearound> getUsersList() async {
    prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.userModel,
    );
    var decoded = utf8.decode(result.bodyBytes);
    UserSitearound userSitearound = userSitearoundFromJson(decoded);
    print(result.body);
    return userSitearound;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserSitearound>(
          future: getUsersList(),
          builder: (context, AsyncSnapshot<UserSitearound> snapshot) {
            if (snapshot.hasError) {
            } else if (snapshot.hasData) {
              return GroupedListView<Result, String>(
                elements: snapshot.data.result,
                groupBy: (element) => element.company.toString() == 'null'
                    ? 'No company'
                    : element.company.name,
                groupComparator: (value1, value2) => value2.compareTo(value1),
                itemComparator: (item1, item2) =>
                    item1.firstName.compareTo(item2.firstName),
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        value.toUpperCase(),
                        style: bl16Style,
                      ),
                    ],
                  ),
                ),
                itemBuilder: (c, element) {
                  return Card(
                    elevation: 3.0,
                    // margin:
                    //     EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      child: ListTile(
                        // contentPadding: EdgeInsets.symmetric(
                        //     horizontal: 20.0, vertical: 10.0),
                        leading: Icon(
                          Icons.account_circle,
                          size: 45,
                          color: Colors.orange,
                        ),
                        title: Text(
                          '${element.firstName} ${element.lastName}',
                          style: bl14Style,
                        ),
                        subtitle: Text(
                          '${element.position}',
                          style: bl14Style,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
