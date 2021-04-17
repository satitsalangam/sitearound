import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/dashboard_model.dart';
import 'package:sitearound/ulility/indicator.dart';
import 'package:sitearound/ulility/text_style.dart';

import 'pieChart.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int touchedIndex;
  String open, overdue, closed;
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
      backgroundColor: Colors.indigo[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.orange,
              size: 25,
            ),
          ),
          title: Row(
            children: [
              Text(
                "Dashboard",
                style: bl22Style,
              ),
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/tabbar1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          toolbarHeight: 90,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 10,
        ),
      ),
      body: FutureBuilder<DashboardModel>(
          future: getDashBoard(),
          builder: (context, AsyncSnapshot<DashboardModel> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.hasError);
            } else if (snapshot.hasData) {
              print(snapshot.hasData);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    showRFI(snapshot),
                    showSubmittal(snapshot),
                    showInspection(snapshot),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget showSubmittal(AsyncSnapshot<DashboardModel> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Text(
              'Submittal',
              style: bl22Style,
            ),
            AspectRatio(
              aspectRatio: 1.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: showPieChart(
                        snapshot,
                        snapshot.data.submittal.open,
                        snapshot.data.submittal.overdue,
                        snapshot.data.submittal.closed,
                        touchedIndex),
                  ),
                ],
              ),
            ),
            showDetail(),
          ],
        ),
      ),
    );
  }

  Widget showInspection(AsyncSnapshot<DashboardModel> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Text(
              'Inspection',
              style: bl22Style,
            ),
            AspectRatio(
              aspectRatio: 1.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: showPieChart(
                        snapshot,
                        snapshot.data.inspection.open,
                        snapshot.data.inspection.overdue,
                        snapshot.data.inspection.closed,
                        touchedIndex),
                  ),
                ],
              ),
            ),
            showDetail(),
          ],
        ),
      ),
    );
  }

  Widget showRFI(AsyncSnapshot<DashboardModel> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Text(
              'RFI',
              style: bl22Style,
            ),
            AspectRatio(
              aspectRatio: 1.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: showPieChart(
                        snapshot,
                        snapshot.data.rfi.open,
                        snapshot.data.rfi.overdue,
                        snapshot.data.rfi.closed,
                        touchedIndex),
                  ),
                ],
              ),
            ),
            showDetail(),
          ],
        ),
      ),
    );
  }

  Widget showDetail() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Indicator(
              color: Color(0xFF0DF06C),
              text: 'Open',
              isSquare: true,
            ),
            SizedBox(
              width: 4,
            ),
            Indicator(
              color: Color(0xfff8b250),
              text: 'Overdue',
              isSquare: true,
            ),
            SizedBox(
              width: 4,
            ),
            Indicator(
              color: Color(0xff845bef),
              text: 'Closed',
              isSquare: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget showPieChart(AsyncSnapshot<DashboardModel> snapshot, open, overdue,
      closed, touchedIndex) {
    return PieChart(
      PieChartData(
        // pieTouchData: PieTouchData(
        //     touchCallback: (pieTouchResponse) {
        //   setState(() {
        //     if (pieTouchResponse.touchInput
        //             is FlLongPressEnd ||
        //         pieTouchResponse.touchInput is FlPanEnd) {
        //       touchedIndex = -1;
        //     } else {
        //       touchedIndex =
        //           pieTouchResponse.touchedSectionIndex;
        //     }
        //   });
        // }),
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        centerSpaceRadius: 0,
        sections:
            showingSections(snapshot, open, overdue, closed, touchedIndex),
      ),
    );
  }
}
