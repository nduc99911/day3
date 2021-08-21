import 'package:day3/home.dart';
import 'package:day3/mycontroler.dart';
import 'package:day3/mycontroler.dart';
import 'package:day3/student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Getx16(),
    );
  }
}

class Getx16 extends StatelessWidget {
  mycontroler controler =
      Get.put(mycontroler(), tag: 'instancel', permanent: true);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                  child: Text('data'),
                  onPressed: () => {Get.find<mycontroler>(tag: 'instancel')})
            ],
          ),
        ),
      ),
    );
  }
}

// Understanding GetX Workers
class FlutterGexEx extends StatelessWidget {
  mycontroler controler = Get.put(mycontroler());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Undertanding GetX'),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                child: Text('Increment'),
                onPressed: () => controler.incremetn(),
              ),
              GetX<mycontroler>(builder: (controler) {
                return Text('Value ${controler.count}');
              }),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  onChanged: (val) {
                    controler.incremetn();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Flutter GetX Unique ID
class FlutterIdEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Heelo')),
        body: Center(
          child: Column(
            children: [
              GetBuilder<mycontroler>(
                  init: mycontroler(),
                  id: 'txtCount',
                  builder: (mycontroler) {
                    return Text('The value is ${mycontroler.count}');
                  }),
              GetBuilder<mycontroler>(
                  init: mycontroler(),
                  builder: (mycontroler) {
                    return Text('The value is ${mycontroler.count}');
                  }),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  child: Text('Count'),
                  onPressed: () => Get.find<mycontroler>().incremetn())
            ],
          ),
        ),
      ),
    );
  }
}

class MyControler extends GetxController {
  final student = Student(name: "Duc", age: 18).obs;
  void convertoUpperCase() {
    student.update((val) {
      val!.name = val.name.toString().toUpperCase();
    });
  }
}

//getxcontroler class
class MyControlerex extends StatelessWidget {
  // mycontroler controler = Get.put(mycontroler());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title: 'State management',
      home: Scaffold(
        appBar: AppBar(
          title: Text('State management'),
        ),
        body: Center(
          child: Column(
            children: [
              GetBuilder<mycontroler>(
                  //     initState: (data) => controler.incremetn(),
                  //     dispose: (_) => controler.cleanUpTask(),
                  init: mycontroler(),
                  builder: (controller) {
                    return Text('The value is ${controller.count}');
                  }),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                  child: Text('Count'),
                  onPressed: () {
                    Get.find<mycontroler>().incremetn();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class StudentEx1 extends StatelessWidget {
  MyControler controler = Get.put(MyControler());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Studetnt'),
        ),
        body: Center(
          child: Column(
            children: [
              Obx(() => Text('Name is ${controler.student.value.name}')),
              RaisedButton(
                  child: Text('Upper'), onPressed: controler.convertoUpperCase)
            ],
          ),
        ),
      ),
    );
  }
}

class StudentEx extends StatelessWidget {
  final student = Student(name: 'duc', age: 20).obs;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('State mângemetn')),
        body: Center(
          child: Column(
            children: [
              Obx(() => Text('Name is ${student.value.name}')),
              RaisedButton(
                  child: Text('Upper'),
                  onPressed: () {
                    student.update((student) {
                      student!.name = student.name.toString().toUpperCase();
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

//router navigation for name router
class routername extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      initialRoute: "/",
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: "/", page: () => MyApp()),
        GetPage(name: "/home", page: () => Home())
      ],
      home: Scaffold(
        appBar: AppBar(
          title: Text('Router name'),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                  child: Text('Go to Home'),
                  onPressed: () {
                    Get.toNamed("/home?channel=Main", arguments: "Data main");
                  })
            ],
          ),
        ),
      ),
    );
  }
}

//route navigation
class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title: "Navigator",
      home: Scaffold(
        appBar: AppBar(title: Text("data")),
        body: Center(
            child: Column(
          children: [
            RaisedButton(
                child: Text('Router'),
                onPressed: () async {
                  // Get.to(Home(),
                  //     fullscreenDialog: true,
                  //     transition: Transition.zoom,
                  //     duration: Duration(milliseconds: 1000),
                  //     //animation
                  //     curve: Curves.bounceOut,
                  //     arguments: "Data From main");
                  var data = await Get.to(Home());
                  print("The data $data");
                })
          ],
        )),
      ),
    );
  }
}

//bottom sheet
class bottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Bottom Sheet')),
        body: Center(
          child: RaisedButton(
              child: Text('data'),
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.access_alarm),
                          title: Text('Light Theme'),
                          onTap: () => {Get.changeTheme(ThemeData.light())},
                        ),
                        ListTile(
                          leading: Icon(Icons.access_alarm),
                          title: Text('Dark Theme'),
                          onTap: () => {Get.changeTheme(ThemeData.dark())},
                        ),
                      ],
                    ),
                  ),
                  barrierColor: Colors.greenAccent.shade100,
                  backgroundColor: Colors.blue,
                  isDismissible: true,
                );
              }),
        ),
      ),
    );
  }
}

//snacbar
class Snackbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title: "Snackbar",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Snackbar'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () =>
                Get.snackbar("Snackbar Title", "This will be snackbar mesage",
                    snackPosition: SnackPosition.BOTTOM,
                    // titleText: Text('Title'),
                    // messageText: Text(
                    //   'Another Message',
                    //   style: TextStyle(color: Colors.white),
                    // )
                    colorText: Colors.black,
                    backgroundColor: Colors.blue,
                    borderRadius: 30,
                    margin: EdgeInsets.all(10),
                    animationDuration: Duration(milliseconds: 3000),
                    isDismissible: true,
                    dismissDirection: SnackDismissDirection.VERTICAL,
                    forwardAnimationCurve: Curves.bounceInOut,
                    icon: Icon(Icons.send), onTap: (val) {
              print('object');
            }, mainButton: TextButton(onPressed: () {}, child: Text('Hêlo'))),
            child: Text('Show SnackBar'),
          ),
        ),
      ),
    );
  }
}

//dialog
class dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dialog"),
        ),
        body: Center(
          child: RaisedButton(
              child: Text('Dialog'),
              onPressed: () {
                Get.defaultDialog(
                  title: "Dialog title",
                  middleText: "This is middle",
                  content: Row(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(child: Text("Date Loading"))
                    ],
                  ),
                  textCancel: "Candle",
                  textConfirm: "Ok",
                  onConfirm: () {},
                  onCancel: () {},
                );
              }),
        ),
      ),
    );
  }
}
