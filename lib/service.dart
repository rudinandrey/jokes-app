import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'models.dart';

class Service {
  static Future<JokesResponse> all(String uuid) async {
    var url = Uri.https('crmit.ru', '/list', {'uuid': uuid});

    print(uuid);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jokes = (convert.jsonDecode(response.body) as List<dynamic>)
          .map((e) => Joke.fromJson(e))
          .toList();
      return JokesResponse(jokes, StatusLoad.success);
    } else {
      return JokesResponse([], StatusLoad.error);
    }
  }

  static Future<VoteResponse> vote(String uuid, int id, int resolution) async {
    var url = Uri.https('crmit.ru', '/vote');
    var response = await http.post(url, body: {
      'uuid': uuid,
      'id': id.toString(),
      'resolution': resolution.toString(),
    });

    if (response.statusCode == 200) {
      return VoteResponse(StatusLoad.success);
    } else {
      return VoteResponse(StatusLoad.error);
    }
  }
}
