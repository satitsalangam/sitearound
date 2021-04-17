import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sitearound/ulility/normal_dialog.dart';
import 'package:sitearound/ulility/text_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'detail_response.dart';

class ResponsePage extends StatefulWidget {
  @override
  _ResponsePageState createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  bool showDetail = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: Colors.orange[50],
      child: SingleChildScrollView(
        child: Column(
          children: [
            showCard('Category 1', Colors.red, size),
            showCard('Category 2', Colors.green, size),
            showCard('Category 3', Colors.blue, size),
            showCard('Category 4', Colors.orange, size),
          ],
        ),
      ),
    );
  }

  Widget showCard(strtitle, strcolor, size) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 70,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    color: strcolor,
                    width: 70,
                    height: 70,
                    child: Icon(Icons.work, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          strtitle,
                          style: bl14Style,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              showIcon(': 0', Colors.blue,
                                  Icons.fiber_manual_record),
                              showIcon(': 0', Colors.green, Icons.check),
                              showIcon(': 0', Colors.red, Icons.close),
                              showIcon(': 0', Colors.grey, Icons.comment),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showDetail = !showDetail;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: showDetail
                          ? Icon(Icons.keyboard_arrow_down, color: Colors.blue)
                          : Icon(Icons.keyboard_arrow_right,
                              color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        showDetail ? showRequest() : SizedBox(),
      ],
    );
  }

  Widget showRequest() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailResponse(),
            ),
          );
        },
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 1,
          // height: MediaQuery.of(context).size.height * 0.1,
          child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'ตรวจสอบความยาวของเหล็กเดือยในเสาเอ็น',
                      style: bl14Style,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            showIcon(
                                ': 0', Colors.blue, Icons.fiber_manual_record),
                            showIcon(': 0', Colors.green, Icons.check),
                            showIcon(': 0', Colors.red, Icons.close),
                            showIcon(': 0', Colors.grey, Icons.comment),
                          ],
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     showbtn(Icons.check, Colors.green),
                    //     showbtn(Icons.clear, Colors.red),
                    //     showbtn(Icons.comment, Colors.blueGrey),
                    //   ],
                    // )
                  ],
                ),
              ]),
        ),
      ),
    );
  }

  Widget showbtn(icon, color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
      child: Center(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color[50],
            shape: BoxShape.circle,
          ),
          child: IconButton(
              icon: Icon(
                icon,
                color: color,
                size: 20,
              ),
              onPressed: () {
                normalDialogAlert(
                    context, 'คุณต้องการอนุมัติโครงการใช่หรือไม่', '');
              }),
        ),
      ),
    );
  }

  Widget showIcon(title, color, icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: color,
        ),
        Text(
          title,
          style: bl14Style,
        )
      ],
    );
  }
}
