import 'package:flutter/material.dart';
import 'package:sitearound/UI/Dashboard/sitearound_dashoard.dart';
import 'package:sitearound/UI/Dynamicsplan/sitearound_dynamicsplan.dart';
import 'package:sitearound/UI/Inspection/sitearound_inspection.dart';
import 'package:sitearound/UI/Pending/sitearound_pending.dart';
import 'package:sitearound/UI/RFI/sitearound_rfi.dart';

import 'package:sitearound/UI/Submittal/sitearound_submittal.dart';
import 'package:sitearound/ulility/button_card.dart';
import 'package:sitearound/ulility/color_style.dart';

class MyHomeMenuMenuPage extends StatefulWidget {
  @override
  _MyHomeMenuMenuPageState createState() => _MyHomeMenuMenuPageState();
}

class _MyHomeMenuMenuPageState extends State<MyHomeMenuMenuPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // color: backgroundColor,
        child: Stack(
          children: <Widget>[
            Container(
              // color: Colors.red,
              height: size.height * 0.75,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      showbuttonCard(
                        context,
                        'Dashboard',
                        'dashboard.png',
                        iconOrange,
                        SiteAroundDashboard(),
                      ),
                      showbuttonCard(
                        context,
                        'My Pending',
                        'pending.png',
                        iconOrange,
                        SitearoundPending(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      showbuttonCard(
                        context,
                        'RFI',
                        'rfi.png',
                        iconOrange,
                        SitearoundRFI(),
                      ),
                      showbuttonCard(
                        context,
                        'Submittal',
                        'submittal.png',
                        iconOrange,
                        SitearoundSubmittal(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      showbuttonCard(
                          context,
                          'Dynamics Plan',
                          'dynamicsplan.png',
                          iconOrange,
                          SitearoundDynamicsPlan()),
                      showbuttonCard(
                        context,
                        'Inspection',
                        'inspection.png',
                        iconOrange,
                        SiteAroundInspection(),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
