import 'package:flutter/material.dart';
import 'package:visualiser/user_handle.dart';
import 'package:visualiser/piechart.dart';
import 'package:visualiser/problemrating.dart';
import 'package:visualiser/barchart.dart';

void main() {
  runApp(const MaterialApp(
    home: MyWidget(),
  ));
}

Widget rw = Row();
Widget w1 = Row();
Widget w2 = Row();
Container container = Container();
Map user_data = {};
Map contest_data = {};

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
            AppBar(title: const Center(child: Text(' Codeforces visaliser'))),
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
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueAccent,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
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
                        }
                        print(user_data);
                        setState(() {
                          if (user.verified == 'OK') {
                            ProblemData da = ProblemData(data: contest_data);
                            da.problemRating();
                            rw = UserData(user: user_data);
                            w1 = PieCharti(data: da.problemtag);
                            w2 = Bar(data: da.problemrating);
                          } else {
                            rw = Center(
                              child: const Text(
                                'Enter valid username',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                            w2 = Row();
                            w1 = Row();
                          }
                        });
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              const SizedBox(height: 35, width: 35),
              rw,
              w1,
              w2,
            ],
          ),
        ));
  }
}
