class Joke {
  final int id;
  final String joke;

  Joke(this.id, this.joke);

  Joke.fromJson(Map<String, dynamic> json)
      : id = int.parse(json["id"]),
        joke = json["joke"];
}

class JokesResponse {
  final List<Joke> jokes;
  final String result;

  JokesResponse(this.jokes, this.result);
}
