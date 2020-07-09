import 'package:flutter/material.dart';
import 'package:jsonFlutterSample/views/first_screen.dart';
import 'package:jsonFlutterSample/views/second_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SecondScreen(),
    );
  }
}
