import 'package:corona_app/config/AppConfig.dart';
import 'package:corona_app/locator.dart';
import 'package:corona_app/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppConfig conf = locator<AppConfig>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'XYZ APP'),
    );
  }
}
