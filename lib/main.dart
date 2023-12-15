import 'package:flutter/material.dart';
import 'package:visualiser/user_handle.dart';
import 'package:visualiser/piechart.dart';
import 'package:visualiser/problemrating.dart';
import 'package:visualiser/barchart.dart';
import 'package:visualiser/table.dart';

void main() {
  runApp(const MaterialApp(
    home: MyWidget(),
  ));
}

Widget rw = Row();
Widget w1 = Row();
Widget w2 = Row();
Widget w3 = Row();
Map user_data = {};
Map contest_data = {};
Map Rating_data = {};

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController textController = TextEditingController();
  String displayText = "";
  Handle user = Handle(handle: 'firestorm_1');
  late Map problemData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar:
            AppBar(title: const Center(child: Text(' Codeforces visualiser'))),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 300,
                      child: TextField(
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                        controller: textController,
                        maxLines: null,
                      )),
                  IconButton(
                      color: Colors.white,
                      onPressed: () async {
                        displayText = textController.text;
                        user = Handle(handle: displayText);
                        await user.getInfo();
                        if (user.verified == 'OK') {
                          user_data = user.userData;
                          contest_data = user.submissionData;
                          Rating_data = user.ratingChange;
                          ProblemData da = ProblemData(data: contest_data);
                          da.problemRating();
                          rw = UserData(user: user_data);
                          w1 = PieChart(tagdata: da.problemtag);
                          w2 = Bar(data: da.problemrating);
                          w3 = RatingTable(rating: Rating_data['result']);
                        } else {
                          String error = " ";
                          if (user.verified == "error") {
                            error = "Not connected to network";
                          } else {
                            error = "Enter valid username";
                          }
                          rw = Center(
                            child: Text(
                              error,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                          w2 = Row();
                          w1 = Row();
                          w3 = Row();
                        }
                        setState(() {
                          rw;
                          w1;
                          w2;
                          w3;
                        });
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              const SizedBox(height: 25, width: 35),
              rw,
              const SizedBox(height: 25, width: 35),
              w1,
              const SizedBox(
                height: 25,
              ),
              w2,
              const SizedBox(
                height: 25,
              ),
              w3,
            ],
          ),
        ));
  }
}
