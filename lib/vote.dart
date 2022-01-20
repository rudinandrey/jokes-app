import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes/jokes_controller.dart';

class Vote extends StatelessWidget {
  Vote({Key? key}) : super(key: key);

  JokesController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Obx(
                () => Text(
                  c.joke.value.joke,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => c.errorMessage.value != ""
              ? Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    c.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(
            () => c.joke.value.id != 0
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          c.like();
                        },
                        child: const Text("Нравится"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          c.dislike();
                        },
                        child: const Text("Не нравится"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ),
        )
      ],
    );
  }
}
