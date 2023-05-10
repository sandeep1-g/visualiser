import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProblemRating {
  String x;
  int y;
  ProblemRating(this.x, this.y);
}

class Bar extends StatefulWidget {
  Map<String, int> data = {};
  Bar({required this.data, super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  List<ProblemRating> lis = [];
  sorting() {
    widget.data.forEach((k, v) => lis.add(ProblemRating(k, v)));
  }

  @override
  void initState() {
    super.initState();
    sorting();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 500.0,
        height: 500.0,
        child: BarChart(BarChartData(
            minY: 0,
            maxY: 500,
            gridData: FlGridData(show: false),
            barTouchData: BarTouchData(enabled: true),
            titlesData: FlTitlesData(
              show: true,
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            barGroups: lis
                .map((element) =>
                    BarChartGroupData(x: int.parse(element.x), barRods: [
                      BarChartRodData(toY: element.y.toDouble()),
                    ]))
                .toList())),
      ),
    );
  }
}
