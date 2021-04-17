import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/user_directory_detail.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class ViewDirectory extends StatefulWidget {
  const ViewDirectory({Key key, this.id, this.name}) : super(key: key);
  final int id;
  final String name;

  @override
  _ViewDirectoryState createState() => _ViewDirectoryState();
}

class _ViewDirectoryState extends State<ViewDirectory> {
  EndPoints endpoints = EndPoints();

  Future<UserDirectoryDetail> getUserDirectoryDetial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.directoryDetailURL
          .replaceAll(':id', widget.id.toString())
          .replaceAll(
            ':project_name',
            prefs.getString('project_name'),
          ),
    );
    var decoded = utf8.decode(result.bodyBytes);
    UserDirectoryDetail userDirectoryDetail =
        userDirectoryDetailFromJson(decoded);

    return userDirectoryDetail;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBartitle(context, '${widget.name}'),
      body: FutureBuilder<UserDirectoryDetail>(
          future: getUserDirectoryDetial(),
          builder: (context, AsyncSnapshot<UserDirectoryDetail> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.hasError);
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.orange,
                    size: 120,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'General Information',
                          style: bl18Style,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          showText(
                              snapshot,
                              'First Name',
                              snapshot.data.firstName == null
                                  ? 'N/A'
                                  : snapshot.data.firstName,
                              size),
                          Divider(
                            thickness: 1,
                          ),
                          showText(
                              snapshot,
                              'Last Name',
                              snapshot.data.lastName == null
                                  ? 'N/A'
                                  : snapshot.data.lastName,
                              size),
                          Divider(
                            thickness: 1,
                          ),
                          showText(
                              snapshot,
                              'Position',
                              snapshot.data.position == null
                                  ? 'N/A'
                                  : snapshot.data.position,
                              size),
                          Divider(
                            thickness: 1,
                          ),
                          showText(
                              snapshot,
                              'Permission',
                              snapshot.data.template.toString() == 'null'
                                  ? 'N/A'
                                  : snapshot.data.template.name,
                              size),
                          Divider(
                            thickness: 1,
                          ),
                          showText(
                              snapshot,
                              'Login Email',
                              snapshot.data.email == null
                                  ? 'N/A'
                                  : snapshot.data.email,
                              size),
                          Divider(
                            thickness: 1,
                          ),
                          showText(
                              snapshot,
                              'Phone',
                              snapshot.data.phone == null
                                  ? 'N/A'
                                  : snapshot.data.phone,
                              size),
                          Divider(
                            thickness: 1,
                          ),
                          showText(
                              snapshot,
                              'Company',
                              snapshot.data.company == null
                                  ? 'N/A'
                                  : snapshot.data.company.name,
                              size),
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget showText(
      AsyncSnapshot<UserDirectoryDetail> snapshot, title, detail, Size size) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.25,
            child: Text(
              title,
              style: bl14Style,
            ),
          ),
          SizedBox(
            width: size.width * 0.55,
            child: Text(
              detail,
              style: bl14Style,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
