import 'package:flutter/material.dart';
import 'package:sitearound/ulility/text_style.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            showTitle('Name : ', 'Floor Inspections on 17th Floor'),
            Divider(
              thickness: 1,
            ),
            showStatus('Status : ', 'In Review', Colors.blue, size),
            Divider(
              thickness: 1,
            ),
            showTitle('Type : ', 'Qualtiy'),
            Divider(
              thickness: 1,
            ),
            showTitle('Discipline : ', 'งานสถาปัตยกรรม'),
            Divider(
              thickness: 1,
            ),
            showTitle('Location : ', 'Building A, Room 1311'),
            Divider(
              thickness: 1,
            ),
            showTitle('Distribution : ', 'N/A'),
            Divider(
              thickness: 1,
            ),
            showTitle('Private : ', 'N/A'),
            Divider(
              thickness: 1,
            ),
            showTitle('Spec Section : : ', 'N/A'),
            Divider(
              thickness: 1,
            ),
            showDetail(
                'Descriptions : ',
                '----------------------------------------------------------------',
                size),
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
                width: MediaQuery.of(context).size.width * 0.65,
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
