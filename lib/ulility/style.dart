import 'package:flutter/material.dart';
import 'package:sitearound/ulility/normal_dialog.dart';
import 'package:sitearound/ulility/text_style.dart';

Widget appBar(BuildContext context, String title) {
  Size size = MediaQuery.of(context).size;
  return PreferredSize(
    preferredSize: Size.fromHeight(65),
    child: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Column(
        children: [
          Text(
            title,
            style: bl22Style,
          ),
        ],
      ),
      flexibleSpace: Container(
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/tabbar1.png"),
              fit: BoxFit.fitHeight),
        ),
      ),
      toolbarHeight: 60,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
    ),
  );
}

Widget appBartitle(BuildContext context, String title) {
  Size size = MediaQuery.of(context).size;
  return PreferredSize(
    preferredSize: Size.fromHeight(80),
    child: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: bl16Style,
          ),
        ],
      ),
      flexibleSpace: Container(
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/tabbar1.png"),
              fit: BoxFit.fitHeight),
        ),
      ),
      toolbarHeight: 60,
      elevation: 0,
      // centerTitle: true,
      automaticallyImplyLeading: false,
    ),
  );
}

Widget showbtnStatus(Size size, status) {
  print('status>>>>>>$status');
  return Container(
    width: size.width * 0.25,
    height: 25,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 2.0,
            color: status == '-1'
                ? Colors.red
                : status == '0'
                    ? Colors.blue
                    : status == '1'
                        ? Colors.blue
                        : status == '2'
                            ? Colors.green
                            : status == '3'
                                ? Colors.red
                                : Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: status == '-1'
            ? Text(
                'Invalid',
                style: red14Style,
              )
            : status == '0'
                ? Text(
                    'Pending',
                    style: blue14Style,
                  )
                : status == '1'
                    ? Text(
                        'In Process',
                        style: blue14Style,
                      )
                    : status == '2'
                        ? Text(
                            'Approved',
                            style: gre12Style,
                          )
                        : status == '3'
                            ? Text(
                                'Rejected',
                                style: red14Style,
                              )
                            : Text(
                                'Deleted',
                                style: red14Style,
                              ),
      ),
    ),
  );
}

Widget showbtnProcess(Size size, process) {
  print('process>>>>>>$process');
  return Container(
    width: size.width * 0.25,
    height: 25,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 2.0,
            color: process == '0'
                ? Colors.red
                : process == '1'
                    ? Colors.blue
                    : process == '2'
                        ? Colors.blue
                        : process == '3'
                            ? Colors.green
                            : Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: process == '0'
            ? Text(
                'Draft',
                style: red14Style,
              )
            : process == '1'
                ? Text(
                    'Review',
                    style: blue14Style,
                  )
                : process == '2'
                    ? Text(
                        'Open',
                        style: blue14Style,
                      )
                    : process == '3'
                        ? Text(
                            'Waiting',
                            style: gre12Style,
                          )
                        : Text(
                            'Closed',
                            style: red14Style,
                          ),
      ),
    ),
  );
}

Widget showBoxtitle(Size size, title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: size.width * 1,
      child: Text(
        title,
        style: bl16Style,
        maxLines: 1,
      ),
    ),
  );
}

Widget showUser(index, name, position) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 3, color: Colors.black26),
      ]),
      height: 70,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: CircleAvatar(
              radius: 25,
              child: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: bl14Style,
              ),
              Text(
                position,
                style: bl14Style,
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget showBoxDetail(Size size, title, detail) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.3,
            child: Text(
              title,
              style: blw14Style,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              ':',
              style: bl14Style,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.45,
                child: Text(
                  detail,
                  style: bl14Style,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget showbtn(Size size, title, icon, color) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      width: size.width * 0.2,
      height: 25,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: color),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: color,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget showbtntabbar(context, size, title, icon, color) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, top: 13, bottom: 13),
    child: GestureDetector(
      onTap: () {
        normalDialogAlert(
            context, 'Are you sure ?', "You won't be able to revert this!");
      },
      child: Container(
        width: 30,
        // height: 20,
        child: Container(
          // decoration: BoxDecoration(
          //   border: Border.all(width: 1.0, color: color),
          //   // borderRadius: BorderRadius.circular(10.0),
          // ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: color,
                ),
                Text(
                  title,
                  style: TextStyle(color: color),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
