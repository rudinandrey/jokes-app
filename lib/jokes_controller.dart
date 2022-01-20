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
  var errorMessage = "".obs;
  String _uuid = "";

  void load(String uuid) {
    _uuid = uuid;
    Service.all(uuid).then((JokesResponse response) {
      if (response.result == StatusLoad.success) {
        jokes.value.addAll(response.jokes);
        if (jokes.value.isNotEmpty) {
          joke.value = jokes.value.removeAt(0);
        } else {
          joke.value = Joke(0, "Больше ничего нет");
        }
      } else {
        joke.value = Joke(0, "Свежих анекдотов пока нет, приходите позже");
      }
    });
  }

  void like() {
    if (joke.value.id > 0) {
      vote(_uuid, joke.value.id, 1);
      _next();
    }
  }

  void dislike() {
    if (joke.value.id > 0) {
      vote(_uuid, joke.value.id, 0);
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

  void vote(String uuid, int id, int resolution) async {
    clearErrorMessage();
    VoteResponse resp = await Service.vote(uuid, id, resolution);
    if (resp.result == StatusLoad.error) {
      errorMessage.value =
          'Не удалось проголосовать, возможно проблема с Интернетом';
    }
  }

  void clearErrorMessage() {
    errorMessage.value = "";
  }
}
