import 'package:flutter/material.dart';
import 'package:sitearound/ulility/text_style.dart';

class RFIQuestion extends StatefulWidget {
  const RFIQuestion({Key key, this.rfiId}) : super(key: key);
  final int rfiId;

  @override
  _RFIQuestionState createState() => _RFIQuestionState();
}

class _RFIQuestionState extends State<RFIQuestion> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(height: 5),
            showCard(size, 'Test User 001', 'Question1'),
            Divider(thickness: 1),
            showCard(size, 'Test User 002', 'Question2'),
          ],
        ),
      ),
    );
  }

  Widget showCard(Size size, title, detail) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              // color: Colors.red,
              width: size.width * 0.2,
              child: CircleAvatar(
                radius: 30,
                child: CircleAvatar(
                  radius: 29,
                  child: Image.asset('assets/images/user.png'),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              // color: Colors.red,
              width: size.width * 0.53,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name :$title', style: bl15Style),
                  Text('$detail', style: bl14Style),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
