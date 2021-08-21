import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('THis is home Screen'),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
                child: Text('Next Screen'),
                color: Colors.blue,
                onPressed: () {}),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
                child: Text('Back To Main'),
                color: Colors.blue,
                onPressed: () {
                  Get.back(result: 'This is from Home Sreenn');
                }),
            SizedBox(
              height: 8,
            ),
            Text('${Get.arguments}'),
            Text("${Get.parameters['channel']}"),
          ],
        ),
      ),
    );
  }
}
