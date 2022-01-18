import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes/jokes_controller.dart';
import 'package:jokes/vote.dart';

void main() {
  runZonedGuarded(() {
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );
  }, (dynamic error, dynamic stack) {
    print("Something went wrong!");
    print(error);
    print(stack);
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  JokesController c = Get.put(JokesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Отборные анекдоты"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: Vote(),
    );
  }
}
