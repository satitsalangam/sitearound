import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<PieChartSectionData> showingSections(
    snapshot,  open,  overdue,  closed,touchedIndex) {
  return List.generate(3, (i) {
    final isTouched = i == touchedIndex;
    final double fontSize = isTouched ? 20 : 16;
    final double radius = isTouched ? 110 : 100;
    final double widgetSize = isTouched ? 55 : 40;

    switch (i) {
      case 0:
        return PieChartSectionData(
          color: const Color(0xFF2FD172),
          value: double.parse('$open'),
          title: '$open',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
          badgeWidget: _Badge(
            'assets/images/worker-svgrepo-com.svg',
            size: widgetSize,
            borderColor: const Color(0xFF2FD172),
          ),
          badgePositionPercentageOffset: .98,
        );
      case 1:
        return PieChartSectionData(
          color: const Color(0xFFFFCB83),
          value: double.parse('$overdue'),
          title: '$overdue',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
          badgeWidget: _Badge(
            'assets/images/librarian-svgrepo-com.svg',
            size: widgetSize,
            borderColor: const Color(0xFFFFCB83),
          ),
          badgePositionPercentageOffset: .98,
        );
      case 2:
        return PieChartSectionData(
          color: const Color(0xFF3ABCF8),
          value: double.parse('$closed'),
          title: '$closed',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
          badgeWidget: _Badge(
            'assets/images/fitness-svgrepo-com.svg',
            size: widgetSize,
            borderColor: const Color(0xFF3ABCF8),
          ),
          badgePositionPercentageOffset: .98,
        );

      default:
        return null;
    }
  });
}

class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Color borderColor;

  const _Badge(
    this.svgAsset, {
    Key key,
    @required this.size,
    @required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      // child: Center(
      //   child: kIsWeb
      //       ? Image.network(svgAsset, fit: BoxFit.contain)
      //       : Svg.asset(
      //           svgAsset,
      //           fit: BoxFit.contain,
      //         ),
      // ),
    );
  }
}
