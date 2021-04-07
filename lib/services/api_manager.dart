import 'dart:convert';


import 'package:hamro_samachar/model/newmodel.dart';
import 'package:http/http.dart' as http;

class API_Manager {


  Future<Newsheadline> getNews() async {
    var client = http.Client();
    var newheadline;

    try {

      var response = await client.get(Uri.parse('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=db80afe0209144429f877bdb48e30554'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newheadline= Newsheadline.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newheadline;
    }

    return newheadline;
  }
}
