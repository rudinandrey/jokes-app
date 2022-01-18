import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'models.dart';

class Service {
  Future<JokesResponse> all(String uuid) async {
    var url = Uri.https('crmit.ru', '/list', {'uuid': uuid});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jokes = (convert.jsonDecode(response.body) as List<dynamic>)
          .map((e) => Joke.fromJson(e))
          .toList();
      return JokesResponse(jokes, "success");
    } else {
      return JokesResponse([], "error");
    }
  }
}
