import 'package:http/http.dart' as http;
import 'dart:convert';

class Handle {
  String handle = "";
  late Map userData;
  late Map submissionData;
  late Map ratingChange;
  String verified = "OK";
  Handle({required this.handle});
  Future<void> getInfo() async {
    try {
      var user_response = await http.get(Uri.parse(
          'https://codeforces.com/api/user.info?handles=' + '$handle'));
      userData = jsonDecode(user_response.body);
      //print(userData);
      var submission_response = await http.get(
          Uri.parse('https://codeforces.com/api/user.status?handle=$handle'));
      submissionData = jsonDecode(submission_response.body);
      var rating_response = await http.get(
          Uri.parse('https://codeforces.com/api/user.rating?handle=$handle'));
      ratingChange = jsonDecode(rating_response.body);
      //print(ratingChange);
      verified = userData['status'];
    } catch (err) {
      print(err);
      verified = 'error';
    }
  }
}
