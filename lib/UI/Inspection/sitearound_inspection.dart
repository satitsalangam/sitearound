import 'package:flutter/material.dart';
import 'package:sitearound/ulility/radial_Progress.dart';
import 'package:sitearound/ulility/style.dart';
import 'package:sitearound/ulility/text_style.dart';

import 'inspection_info.dart';

class SiteAroundInspection extends StatefulWidget {
  @override
  _SiteAroundInspectionState createState() => _SiteAroundInspectionState();
}

class _SiteAroundInspectionState extends State<SiteAroundInspection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, 'Inspection'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InspectionInfo(),
                    ),
                  );
                },
                child: showCardDetail(
                    'Floor Inspections on 17th Floor',
                    'In Review',
                    'assets/icons/Ellipse20.png',
                    Colors.blue,
                    0.8,
                    size),
              ),
              showCardDetail('Unit room A1123', 'Open',
                  'assets/icons/Ellipse20.png', Colors.green, 0.6, size),
              showCardDetail('Floor Inspections on 19th Floor', 'Closed',
                  'assets/icons/Ellipse20.png', Colors.red, 0.4, size),
              showCardDetail('Floor Inspections on 22th Floor', 'Closed',
                  'assets/icons/Ellipse20.png', Colors.red, 0.8, size)
            ],
          ),
        ),
      ),
    );
  }

  Widget showCardDetail(
      title, state, image, Color colors, progress, Size size) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.6,
                    child: SizedBox(
                      child: Text(
                        title,
                        style: bl16Style,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.25,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: colors),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          state,
                          style: TextStyle(color: colors),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: RadialProgress(
                        progress: progress,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Type       : Quality Test', style: bl12Style),
                        Text('Location   : Building A,Room 1311',
                            style: bl12Style),
                        Text('Assignees : Mister Tester', style: bl12Style),
                        Text('Due Date  : 25/02/2021', style: bl12Style),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
