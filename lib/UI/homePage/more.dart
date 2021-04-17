import 'package:flutter/material.dart';
import 'package:sitearound/UI/Directory/directory.dart';
import 'package:sitearound/UI/Location/sitearound_location.dart';
import 'package:sitearound/UI/ProjectInformation/sitearound_project.dart';
import 'package:sitearound/ulility/text_style.dart';

class MyMore extends StatefulWidget {
  @override
  _MyMoreState createState() => _MyMoreState();
}

class _MyMoreState extends State<MyMore> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyDirectory(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: size.width,
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset('assets/images/discipline.png'),
                      ),
                      Text(
                        'Directory',
                        style: bl22Style,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Divider(thickness: 1),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SitearoundLocation(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: size.width,
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset('assets/images/location.png'),
                      ),
                      Text(
                        'Location',
                        style: bl22Style,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(thickness: 1),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SitearoundProject(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: size.width,
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(
                            'assets/images/project_information.png'),
                      ),
                      Text(
                        'Project Information',
                        style: bl22Style,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}
