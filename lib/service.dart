import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'models.dart';

class Service {
  Future<JokesResponse> all(String uuid) async {
    var url = Uri.https('crmit.ru', '/all', {'uuid': uuid});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
    }
    var jokes = JokesResponse([], "success");
    return jokes;
  }
}
