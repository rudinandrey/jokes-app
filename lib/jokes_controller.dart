import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:jokes/service.dart';
import 'package:crypto/crypto.dart';

import 'models.dart';

class JokesController extends GetxController {
  var jokes = RxList<Joke>().obs;
  var joke = Joke(0, "").obs;

  @override
  void onInit() {
    super.onInit();
    print("init");

    Service s = Service();
    getUUID().then(
      (uuid) => s.all(uuid).then((JokesResponse response) {
        if (response.result == "success") {
          jokes.value.addAll(response.jokes);
          if (jokes.value.isNotEmpty) {
            joke.value = jokes.value.removeAt(0);
          } else {
            joke.value = Joke(0, "Больше ничего нет");
          }
        }
      }),
    );
  }

  void like() {
    if (joke.value.id > 0) {
      _next();
    }
  }

  void dislike() {
    if (joke.value.id > 0) {
      _next();
    }
  }

  void _next() {
    if (jokes.value.isNotEmpty) {
      joke.value = jokes.value.removeAt(0);
    } else {
      joke.value = Joke(0, "Анекдоты закончились");
    }
  }

  Future<String> getUUID() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    print("DeviceInfoPlugin");
    print(deviceInfoPlugin);
    var info = await deviceInfoPlugin.androidInfo;
    print("info");
    print(info);

    return getUniqUuid();

    // if (Platform.isAndroid) {
    //   var info = await deviceInfoPlugin.androidInfo;
    //   print(info);
    //   return info.androidId != null ? info.androidId! : getUniqUuid();
    // } else {
    //   return getUniqUuid();
    // }
  }

  String getUniqUuid() {
    String time = (DateTime.now()).millisecondsSinceEpoch.toString();
    return sha256.convert(utf8.encode(time)).toString();
  }
}
