import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'models.dart';

class Service {
  Future<JokesResponse> all(String uuid) async {
    var url = Uri.https('crmit.ru', '/list', {'uuid': uuid});

    var response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      print(jsonResponse.length);
    } else {
      print("error");
    }
    var jokes = JokesResponse([], "success");
    return jokes;
  }
}
