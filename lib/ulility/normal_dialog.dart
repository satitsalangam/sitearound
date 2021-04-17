import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

Future<void> normalDialog(BuildContext context, String title, desc) async {
  AwesomeDialog(
    context: context,
    borderSide: BorderSide(color: Colors.white, width: 2),
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    dialogType: DialogType.ERROR,
    animType: AnimType.BOTTOMSLIDE,
    title: title,
    desc: desc,
    // body: Center(
    //   child: Text(
    //     title,
    //     style: bl14Style,
    //   ),
    // ),
    // showCloseIcon: true,
    // btnCancelOnPress: () {},
    // btnOkOnPress: () {},
  )..show();
}

Future<void> normalDialogAlert(
    BuildContext context, String title, String subtitle) async {
  AwesomeDialog(
    context: context,
    borderSide: BorderSide(color: Colors.orange, width: 2),
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    dialogType: DialogType.WARNING,
    animType: AnimType.BOTTOMSLIDE,
    title: title,
    desc: subtitle,
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () {},
  )..show();
}
