import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/screen/home/model/home_model.dart';

class APIHelper {
  Future<HomeModel?> quizAPICall() async {
    var jsonString ="https://opentdb.com/api.php?amount=10&category=19&type=multiple";
    var response = await http.get(Uri.parse(jsonString));

    if (response.statusCode == 200) {
      var quizData = jsonDecode(response.body);
      HomeModel quiz = HomeModel.mapToModel(quizData);
      print(response.body);
      return quiz;
      }
    print("NULL");
    return null;
  }
}
