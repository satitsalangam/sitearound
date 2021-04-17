import 'package:flutter/material.dart';
import 'package:sitearound/ulility/text_style.dart';

class DetailResponse extends StatefulWidget {
  @override
  _DetailResponseState createState() => _DetailResponseState();
}

class _DetailResponseState extends State<DetailResponse> {
  bool cmstate = false;
  bool atstate = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.orange,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Detail Response',
          style: bl22Style,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/tabbar1.png"),
            fit: BoxFit.cover,
          )),
        ),
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 10,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            // color: Colors.orange[50],
            width: size.width,
            // height: size.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [],
                  ),
                  Text(
                    'ตรวจสอบความยาวของเหล็กเดือยในเสาเอ็นผนังตามข้อกำหนดของแต่ละโครงการ (AR07.01-1)',
                    style: bl14Style,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      showbtn(Icons.check, Colors.green, 25.0),
                      showbtn(Icons.clear, Colors.red, 25.0),
                      showbtn(Icons.error_outline, Colors.blueGrey, 30.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          showComment('Comment', '2 Comment'),
          Divider(
            thickness: 1,
          ),
          cmstate ? showCommentDetail(size) : SizedBox(),
          showAttached('Attached', '2 Files'),
          atstate ? showAttacheDetail(size) : SizedBox(),
          Divider(
            thickness: 1,
          ),
        ],
      )),
    );
  }

  Widget showAttacheDetail(Size size) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                enabled: false,
                cursorColor: Colors.greenAccent,
                decoration: InputDecoration(
                    icon: Icon(Icons.attachment),
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                enabled: false,
                cursorColor: Colors.greenAccent,
                decoration: InputDecoration(
                  icon: Icon(Icons.attachment),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Divider(
                thickness: 1,
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.35, vertical: 8)),
                onPressed: () {},
                child: Text(
                  'Upload File',
                  style: bl14Style,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showCommentDetail(Size size) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Column(
          children: [
            showUsercomment(size),
            showUsercomment(size),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.greenAccent,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showComment(title, titledetail) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: bl14Style,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    cmstate = !cmstate;
                  });
                },
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        titledetail,
                        style: bl14Style,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      cmstate
                          ? Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.blueGrey,
                            )
                          : Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.blueGrey,
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showAttached(title, titledetail) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: bl14Style,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    atstate = !atstate;
                  });
                },
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        titledetail,
                        style: bl14Style,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      atstate
                          ? Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.blueGrey,
                            )
                          : Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.blueGrey,
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showUsercomment(Size size) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: size.width,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: CircleAvatar(
                      radius: 22,
                      child: CircleAvatar(
                        radius: 21,
                        backgroundImage:
                            AssetImage('assets/images/Profile.png'),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Username : ',
                              style: bl14Style,
                            ),
                            Text(
                              'Date Time',
                              style: bl14Style,
                            )
                          ],
                        ),
                        Text(
                          '--------------------------------------------------------------------------------------------------------------------------',
                          style: bl14Style,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showbtn(icon, color, size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
      child: Center(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color[100],
            shape: BoxShape.circle,
          ),
          child: IconButton(
              icon: Icon(
                icon,
                color: color,
                size: size,
              ),
              onPressed: () {}),
        ),
      ),
    );
  }
}
