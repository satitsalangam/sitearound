import 'package:flutter/material.dart';
import 'package:sitearound/ulility/text_style.dart';

class EditInspection extends StatefulWidget {
  @override
  _EditInspectionState createState() => _EditInspectionState();
}

class _EditInspectionState extends State<EditInspection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.orange,
              size: 25.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            children: [
              Text("Inspection", style: bl22Style),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 30, top: 30),
              child: Container(
                width: size.width * 0.2,
                // height: 20,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.orange[700]),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          size: 20,
                          color: Colors.orange[700],
                        ),
                        Text(
                          'Save',
                          style: TextStyle(color: Colors.orange[700]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            showTitle(),
            Divider(
              thickness: 1,
            ),
            showStatus(size),
            Divider(
              thickness: 1,
            ),
            showTextFormField('Type : '),
            Divider(
              thickness: 1,
            ),
            showTextFormField('Discipline : '),
            Divider(
              thickness: 1,
            ),
            showTextFormField('Location : '),
            Divider(
              thickness: 1,
            ),
            showTextFormField('Distribution : '),
            Divider(
              thickness: 1,
            ),
            showTextFormField('Private : '),
            Divider(
              thickness: 1,
            ),
            showTextFormField('Spec Section : '),
            Divider(
              thickness: 1,
            ),
            showTextFormField('Private : '),
            Divider(
              thickness: 1,
            ),
            showTextFormField('Description : '),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget showTextFormField(title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: bl14Style,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  enabled: false,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showStatus(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Status',
            style: bl14Style,
          ),
          Container(
            width: size.width * 0.7,
            child: Row(
              children: [
                btnStatus('Open', Colors.grey, size),
                btnStatus('In Review', Colors.blue, size),
                btnStatus('Closed', Colors.grey, size),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget btnStatus(title, color, Size size) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 30, top: 30),
      child: Container(
        width: size.width * 0.2,
        // height: 20,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: color),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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

  Widget showTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
      child: Row(
        children: [
          Text(
            'General Information',
            style: bl22Style,
          ),
        ],
      ),
    );
  }
}
