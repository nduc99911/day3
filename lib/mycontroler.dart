import 'package:flutter/material.dart';
import 'package:get/get.dart';

class mycontroler extends GetxController {
  var count = 0.obs;
  void incremetn() {
    // await Future<int>.delayed(Duration(seconds: 5));
    this.count++;
    update();
  }

  void cleanUpTask() {
    print('Clean up task');
  }

  @override
  void onInit() {
    print("init call");
    // TODO: implement onInit
    // ever(count, (_) => print(count));
    // once(count, (_) => print(count));
    // debounce(count, (_) => print(count), time: Duration(seconds: 1));
    interval(count, (_) => print(count), time: Duration(seconds: 3));
    super.onInit();
  }

  @override
  void onClose() {
    print("close call");
    // TODO: implement onClose
    super.onClose();
  }
}
