import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/rfi_Model.dart';
import 'package:sitearound/Models/user_directory.dart';
import 'package:sitearound/UI/Directory/components/directory_view.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class MyDirectory extends StatefulWidget {
  @override
  _MyDirectoryState createState() => _MyDirectoryState();
}

class _MyDirectoryState extends State<MyDirectory> {
  EndPoints endpoints = EndPoints();

  Future<UserDirectory> getUserDirectory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.directoryURL.replaceAll(
        ':project_name',
        prefs.getString('project_name'),
      ),
    );
    var decoded = utf8.decode(result.bodyBytes);
    UserDirectory userDirectory = userDirectoryFromJson(decoded);
    print('dynamic>>>>>${result.body}');
    print('decoded>>>>>$decoded');
    print(result);
    return userDirectory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBartitle(context, 'Directory'),
      body: FutureBuilder<UserDirectory>(
          future: getUserDirectory(),
          builder: (context, AsyncSnapshot<UserDirectory> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.hasError);
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.result.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      Card(
                        child: Container(
                          child: ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: Colors.orange,
                              size: 45,
                            ),
                            title: Text(snapshot.data.result[index].fullName,
                                style: bl13Style),
                            subtitle: Text(
                              snapshot.data.result[index].email,
                              style: bl14Style,
                            ),
                            trailing: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewDirectory(
                                      id: snapshot.data.result[index].id,
                                      name:
                                          snapshot.data.result[index].fullName,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  minimumSize: Size.zero),
                              icon: Icon(
                                Icons.search,
                                size: 15,
                              ),
                              label: Padding(
                                padding:
                                    const EdgeInsets.only(top: 3, bottom: 3),
                                child: Text(
                                  'View',
                                  style: bl10Style,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
