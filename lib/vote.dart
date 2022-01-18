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
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Obx(
                () => Text(
                  c.joke.value.joke,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
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
                        child: Text("Нравится"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          c.dislike();
                        },
                        child: Text("Не нравится"),
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
