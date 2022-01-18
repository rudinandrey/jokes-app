import 'package:get/get.dart';
import 'package:jokes/service.dart';

import 'models.dart';

class JokesController extends GetxController {
  var jokes = RxList<Joke>().obs;
  var joke = Joke(0, "").obs;

  @override
  void onInit() {
    super.onInit();
    print("init");

    Service s = Service();
    s.all("1").then((JokesResponse response) {
      if (response.result == "success") {
        jokes.value.addAll(response.jokes);
        if (jokes.value.isNotEmpty) {
          joke.value = jokes.value.removeAt(0);
        } else {
          joke.value = Joke(0, "Больше ничего нет");
        }
      }
    });
  }

  void like() {
    if (joke.value.id > 0) {}
  }

  void dislike() {
    if (joke.value.id > 0) {}
  }
}
