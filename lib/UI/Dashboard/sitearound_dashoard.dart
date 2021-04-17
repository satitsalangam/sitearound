import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/dashboard_model.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

class SiteAroundDashboard extends StatefulWidget {
  @override
  _SiteAroundDashboardState createState() => _SiteAroundDashboardState();
}

class _SiteAroundDashboardState extends State<SiteAroundDashboard> {
  EndPoints endpoints = EndPoints();
  SharedPreferences prefs;
  Future<DashboardModel> getDashBoard() async {
    prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.dashBoard.replaceAll(
        ':project_name',
        prefs.getString('project_name'),
      ),
    );
    print(result.statusCode);
    DashboardModel dashBoard = dashboardModelFromJson(result.body);
    print(dashBoard);
    print(result);
    return dashBoard;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, 'Dashboard'),
      body: FutureBuilder<DashboardModel>(
          future: getDashBoard(),
          builder: (context, AsyncSnapshot<DashboardModel> snapshot) {
            if (snapshot.hasError) {
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 5, right: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child: Image.asset('assets/images/iconrfi.png'),
                          ),
                          // IconButton(
                          //     icon: Image.asset('assets/images/iconrfi.png'),
                          //     onPressed: () {}),
                          Text(
                            'RFI',
                            style: GoogleFonts.lato(
                                fontSize: 22,
                                color: Color.fromRGBO(14, 114, 171, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      showRFI(size, snapshot, Color.fromRGBO(109, 156, 182, 1)),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child:
                                Image.asset('assets/images/iconnsubmittal.png'),
                          ),
                          Text(
                            'SUBMITTAL',
                            style: GoogleFonts.lato(
                                fontSize: 22,
                                color: Color.fromRGBO(235, 150, 0, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      showSubmittal(
                        size,
                        snapshot,
                        Color.fromRGBO(255, 238, 214, 1),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child:
                                Image.asset('assets/images/iconinspection.png'),
                          ),
                          Text(
                            'INSPECTION',
                            style: GoogleFonts.lato(
                                fontSize: 22,
                                color: Color.fromRGBO(33, 143, 64, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      showInspection(
                        size,
                        snapshot,
                        Color.fromRGBO(227, 255, 214, 1),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget showInspection(
      Size size, AsyncSnapshot<DashboardModel> snapshot, color) {
    return Container(
      height: size.height * 0.19,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          showDashboard(size, 'Open', snapshot.data.inspection.open.toString(),
              Color.fromRGBO(163, 229, 181, 1), green48Style),
          showDashboard(
              size,
              'Overdue',
              snapshot.data.inspection.overdue.toString(),
              Color.fromRGBO(163, 229, 181, 1),
              green48Style),
          showDashboard(
              size,
              'Closed',
              snapshot.data.inspection.closed.toString(),
              Color.fromRGBO(163, 229, 181, 1),
              green48Style),
        ],
      ),
    );
  }

  Widget showSubmittal(
      Size size, AsyncSnapshot<DashboardModel> snapshot, color) {
    return Container(
      height: size.height * 0.19,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          showDashboard(size, 'Open', snapshot.data.submittal.open.toString(),
              Color.fromRGBO(255, 216, 147, 1), org48Style),
          showDashboard(
              size,
              'Overdue',
              snapshot.data.submittal.overdue.toString(),
              Color.fromRGBO(255, 216, 147, 1),
              org48Style),
          showDashboard(
              size,
              'Closed',
              snapshot.data.submittal.closed.toString(),
              Color.fromRGBO(255, 216, 147, 1),
              org48Style),
        ],
      ),
    );
  }

  Widget showRFI(Size size, AsyncSnapshot<DashboardModel> snapshot, color) {
    return Container(
      height: size.height * 0.19,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          showDashboard(size, 'Open', snapshot.data.rfi.open.toString(),
              Color.fromRGBO(186, 236, 239, 1), blue48Style),
          showDashboard(size, 'Overdue', snapshot.data.rfi.overdue.toString(),
              Color.fromRGBO(186, 236, 239, 1), blue48Style),
          showDashboard(size, 'Closed', snapshot.data.rfi.closed.toString(),
              Color.fromRGBO(186, 236, 239, 1), blue48Style),
        ],
      ),
    );
  }

  Widget showDashboard(Size size, title, number, color, style) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        width: size.width * 0.3,
        decoration: BoxDecoration(
          color: color,
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 10, color: Colors.black26)
          // ]
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: bl18bStyle,
                  ),
                ),
              ],
            ),
            // Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    number,
                    style: style,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
