import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart {
  String x;
  int y;
  Chart(this.x, this.y);
}

class PieChart extends StatefulWidget {
  final Map<String, int> tagdata;
  const PieChart({super.key, required this.tagdata});
  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  final List<Chart> _chartdata = [];
  @override
  Widget build(BuildContext context) {
    _chartdata.clear();
    widget.tagdata.forEach((k, v) => _chartdata.add(Chart(k, v)));
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      //constraints: BoxConstraints(minWidth: 10, maxWidth: 10),,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: SfCircularChart(
        title: ChartTitle(
            text: 'Tags solved',
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          backgroundColor: Colors.white,
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CircularSeries>[
          PieSeries<Chart, String>(
            dataSource: _chartdata,
            xValueMapper: (Chart data, _) => data.x,
            yValueMapper: (Chart data, _) => data.y,
            dataLabelSettings: const DataLabelSettings(
                isVisible: true, textStyle: TextStyle(color: Colors.white)),
            enableTooltip: true,
          )
        ],
      ),
    );
  }
}

class UserData extends StatefulWidget {
  Map user = {'handle': 'firestorm_1'};
  UserData({required this.user, super.key});
  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final Map clr = {
    'newbie': HexColor("#808488"),
    'pupil': HexColor("#008000"),
    'specialist': HexColor('#03A89E'),
    'expert': HexColor('#0A00FF'),
    'candidate master': HexColor('#AC0FB4'),
    'master': HexColor('#FF8C00'),
    'international master': HexColor('#FF8C00'),
    'grandmaster': Colors.red,
    'international grandmaster': Colors.red,
    'legendary grandmaster': Colors.red
  };
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          //constraints: BoxConstraints(minWidth: 10, maxWidth: 10),,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.user['result'][0]['avatar'].toString(),
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
            Text(widget.user['result'][0]['handle'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: clr[widget.user['result'][0]['rank']],
                  fontSize: 35,
                )),
            Text('Firstname      : ${widget.user['result'][0]['firstName']}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text('Lastname      : ${widget.user['result'][0]['lastName']}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text('Country          : ${widget.user['result'][0]['country']}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text(
              'Organization : ${widget.user['result'][0]['organization']}',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Text('Rating        : ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                Text(widget.user['result'][0]['rating'].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: clr[widget.user['result'][0]['rank']],
                    )),
                Text('max.(${widget.user['result'][0]['maxRating']})',
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: clr[widget.user['result'][0]['maxRank']],
                    ))
              ],
            ),
            Row(
              children: [
                const Text('Rank          :',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                Text(widget.user['result'][0]['rank'],
                    style: TextStyle(
                      color: clr[widget.user['result'][0]['rank']],
                      fontWeight: FontWeight.bold,
                    )),
                Text('(max.${widget.user['result'][0]['maxRank']})',
                    softWrap: true,
                    style: TextStyle(
                      color: clr[widget.user['result'][0]['maxRank']],
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ]))
    ]);
  }
}
