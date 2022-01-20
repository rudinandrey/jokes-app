import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes/jokes_controller.dart';
import 'package:jokes/vote.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  JokesController c = Get.put(JokesController());

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
    String uuid = info.androidId != null ? info.androidId! : getUniqUuid();
    c.load(uuid);
  }

  String getUniqUuid() {
    String time = (DateTime.now()).millisecondsSinceEpoch.toString();
    return sha256.convert(utf8.encode(time)).toString();
  }

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
