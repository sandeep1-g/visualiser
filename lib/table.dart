import 'package:flutter/material.dart';

class RatingTable extends StatefulWidget {
  late List rating = [];
  RatingTable({required this.rating, super.key});
  @override
  State<RatingTable> createState() => _RatingTableState();
}

class _RatingTableState extends State<RatingTable> {
  @override
  Widget build(BuildContext context) {
    List<TableRow> rows = widget.rating.map((rate) {
      return TableRow(children: [
        TableCell(
            child: Text(rate['contestName'].toString(),
                style: const TextStyle(color: Colors.white))),
        TableCell(
            child: Text(rate['rank'].toString(),
                style: const TextStyle(color: Colors.white))),
        TableCell(
            child: Text(rate['oldRating'].toString(),
                style: const TextStyle(color: Colors.white))),
        TableCell(
            child: Text(rate['newRating'].toString(),
                style: const TextStyle(color: Colors.white))),
      ]);
    }).toList();
    rows.insert(
        0,
        const TableRow(children: [
          TableCell(
              child: Text('Contest',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          TableCell(
              child: Text('Rank',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          TableCell(
              child: Text('Old Rating',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          TableCell(
              child: Text('New Rating',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        ]));
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 200,
        child: SingleChildScrollView(
          child: Table(
            border: TableBorder.all(width: 1.0, color: Colors.black),
            children: rows,
          ),
        ),
      ),
    );
  }
}
