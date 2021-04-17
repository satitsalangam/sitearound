import 'package:flutter/material.dart';
import 'package:sitearound/ulility/text_style.dart';

class InspectionPage extends StatefulWidget {
  @override
  _InspectionPageState createState() => _InspectionPageState();
}

class _InspectionPageState extends State<InspectionPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        // color: Colors.amber,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            showTitle('Inspection Date : ', 'N/A'),
            Divider(
              thickness: 1,
            ),
            showTitle('Due Date : ', 'N/A'),
            Divider(
              thickness: 1,
            ),
            showTitle('Assigness(s) : ', 'N/A'),
            Divider(
              thickness: 1,
            ),
            showTitle('Responsible Contractor : ', 'N/A'),
            Divider(
              thickness: 1,
            ),
            showTitle('Point Of Contract :', 'N/A'),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget showTitle(title, detail) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: bl14Style,
          ),
          Text(
            detail,
            style: bl15Style,
          ),
        ],
      ),
    );
  }

  Widget showDetail(title, detail, size) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: bl14Style,
          ),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.72,
                child: Text(
                  '$detail',
                  style: bl15Style,
                  overflow: TextOverflow.fade,
                  maxLines: null,

                  // softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget showStatus(title, state, Color color, size) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: bl14Style,
          ),
          Container(
            width: size.width * 0.25,
            height: 30,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: color),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3, top: 3),
                      child: Text(state, style: TextStyle(color: color)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
