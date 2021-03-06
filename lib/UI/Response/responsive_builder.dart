import 'package:flutter/material.dart';
import 'package:sitearound/UI/Response/size_information.dart';
import 'package:sitearound/ulility/ui_utils.dart';


class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, SizeInformation sizeInformation)
      builder;
  const ResponsiveBuilder({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        var sizeInformation = SizeInformation(
            orientation: mediaQuery.orientation,
            deviceScreenType: getDeviceScreenType(mediaQuery),
            screenSize: mediaQuery.size,
            localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight));
        // print(sizeInformation.toString());
        return builder(context, sizeInformation);
      },
    );
  }
}
