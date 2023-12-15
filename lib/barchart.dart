import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
  int m = 0, y = 0;
  sorting() {
    widget.data.forEach((k, v) => lis.add(ProblemRating(k, v)));
  }

  @override
  Widget build(BuildContext context) {
    lis.clear();
    sorting();
    m = lis.length;
    if (m > 7) {
      y = 7;
    } else {
      y = m;
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      //constraints: BoxConstraints(minWidth: 10, maxWidth: 10),,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: SfCartesianChart(
        title: ChartTitle(
            text: 'Problem Ratings', textStyle: TextStyle(color: Colors.white)),
        tooltipBehavior: TooltipBehavior(
          enable: true,
        ),
        primaryXAxis: CategoryAxis(
          visibleMinimum: y.toDouble(),
          visibleMaximum: m.toDouble(),
        ),
        primaryYAxis: NumericAxis(
            majorGridLines: const MajorGridLines(
          width: 0,
        )),
        zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true,
        ),
        series: <ColumnSeries<ProblemRating, String>>[
          ColumnSeries<ProblemRating, String>(
            // Binding the chartData to the dataSource of the bar series.
            enableTooltip: true,
            dataSource: lis,
            xValueMapper: (ProblemRating rating, _) => rating.x,
            yValueMapper: (ProblemRating rating, _) => rating.y,
            name: 'problem',
            spacing: 0.5,
            animationDuration: 200,
          ),
        ],
      ),
    );
  }
}
