// @dart=2.9

import 'package:http_test_flutter/pages/homePage.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


