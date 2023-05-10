import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:pie_chart/pie_chart.dart';

//import 'package:fl_chart/fl_chart.dart' as fl;
class PieCharti extends StatefulWidget {
  late Map<String, double> data;
  PieCharti({super.key, required this.data});
  @override
  State<PieCharti> createState() => _PieChartiState();
}

class _PieChartiState extends State<PieCharti> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: widget.data,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 16,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      initialAngleInDegree: 0,
      ringStrokeWidth: 16,
      legendOptions: const LegendOptions(
          showLegendsInRow: true,
          legendPosition: LegendPosition.bottom,
          showLegends: true,
          legendTextStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: true,
        decimalPlaces: 1,
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
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          //constraints: BoxConstraints(minWidth: 10, maxWidth: 10),,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(widget.user['result'][0]['handle'].toString(),
                  style: TextStyle(
                    color: clr[widget.user['result'][0]['rank']],
                    fontSize: 35,
                  )),
              Text('Firstname      : ' +
                  widget.user['result'][0]['firstName'].toString()),
              Text('Lastname      : ' +
                  widget.user['result'][0]['lastName'].toString()),
              Text('Country          : ' +
                  widget.user['result'][0]['country'].toString()),
              Text('Organisation : ' +
                  widget.user['result'][0]['organisation'].toString()),
              Row(
                children: [
                  Text('Rating        : '),
                  Text(widget.user['result'][0]['rating'].toString(),
                      style: TextStyle(
                        color: clr[widget.user['result'][0]['rank'].toString()],
                      )),
                  Text(
                      '(' +
                          widget.user['result'][0]['maxRating'].toString() +
                          ')',
                      style: TextStyle(
                        color:
                            clr[widget.user['result'][0]['maxRank'].toString()],
                      ))
                ],
              ),
              Row(
                children: [
                  Text('Rank          :'),
                  Text(widget.user['result'][0]['rank'].toString(),
                      style: TextStyle(
                        color: clr[widget.user['result'][0]['rank'].toString()],
                      )),
                  Text(
                      '(' +
                          widget.user['result'][0]['maxRank'].toString() +
                          ')',
                      style: TextStyle(
                        color:
                            clr[widget.user['result'][0]['maxRank'].toString()],
                      ))
                ],
              ),
            ]),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: widget.user['result'][0]['avatar'].toString(),
              width: 200,
              height: 200,
            )
          ]))
    ]);
  }
}
