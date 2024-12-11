import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  get increment => null;

  get count => null;

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }

  void getsnackbar() {
    Get.snackbar('Get Snackbar', 'Ini adalah getx snackbar',
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  void getbottonsheet() {
    Get.bottomSheet(Container(
      height: 200,
      color: Colors.green,
      child: const Center(
        child: Text(
          'Ini adalah getx botton sheet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    ));
  }
}