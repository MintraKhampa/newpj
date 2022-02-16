import 'package:flutter/material.dart';
import 'package:test1/State/Dasktop.dart';
import 'package:test1/State/Register.dart';
import 'package:test1/State/page/timer.dart';
// import 'package:test1/State/update_todolist.dart';
import 'package:test1/utility/my_constant.dart';
// import 'package:test1/State/qrcode.dart';
import 'package:test1/State/mainpage.dart';
import 'package:test1/State/page/page.dart';

final Map<String, WidgetBuilder> map = {
  '/dasktop': (BuildContext context) => Dasktop(),
  '/register': (BuildContext context) => Register(),
  '/mainpage': (BuildContext context) => Mainpage(),
  '/page': (BuildContext context) => AddPage1(),
  '/timer': (BuildContext context) => Timer(),
  // '/update_todolist':(BuildContext context) => UpdatePage(V1, V2, V3),
};

String? initlalRoute;

void main() {
  initlalRoute = Myconstat.routedasktop;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Myconstat.appName,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}
// import 'package:flutter/material.dart';
// // import 'package:test1/State/add.dart';
// import 'package:test1/State/todolist.dart';
// import 'package:test1/utility/my_constant.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: Myconstat.appName,
//       home: Todolist(),
//     );
//   }
// }
