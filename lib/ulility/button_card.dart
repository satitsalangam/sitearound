import 'package:flutter/material.dart';
import 'package:sitearound/ulility/text_style.dart';

Widget showbuttonCard(
    BuildContext context, String title, imageicon, color, onProcess) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => onProcess,
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.only(left: 7, right: 7, bottom: 5, top: 10),
      height: size.height * 0.215,
      width: size.width * 0.45,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey.shade400,
            offset: Offset.lerp(
              Offset(0, 1),
              Offset(1, 0),
              0,
            ),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/$imageicon'),
                Text(
                  title,
                  style: bl16Style,
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
