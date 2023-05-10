import 'package:http/http.dart' as http;
import 'dart:convert';

class Handle {
  String handle = "";
  late Map userData;
  late Map submissionData;
  String verified = "failed";
  Handle({required this.handle});
  Future<void> getInfo() async {
    var user_response = await http.get(
        Uri.parse('https://codeforces.com/api/user.info?handles=' + '$handle'));
    userData = jsonDecode(user_response.body);
    var submission_response = await http.get(
        Uri.parse('https://codeforces.com/api/user.status?handle=$handle'));
    submissionData = jsonDecode(submission_response.body);
    verified = userData['status'];
  }
}
