import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class service extends GetxService {
  Future<void> incrementCounter() async {
    SharedPreferences pred = await SharedPreferences.getInstance();
    int counter = (pred.getInt('counter') ?? 0) + 1;
    print('Oeses $counter time.');
    await pred.setInt('counter', counter);
  }
}
