//System imports
import 'package:flutter/material.dart';

///The class used to store the configurable items for the application
class AppConfig {
  final String appName = 'APP NAME';
  //final String baseURL = 'http://192.168.43.120:8080/api/';
  final String baseURL = 'http://10.0.2.2:8080/api/';
  // final String baseURL = 'http://localhost:8080/api/';
  final Color primaryColor = Colors.white;
  final Color secondaryColor = Colors.red;
  final Color textPrimaryColor = Colors.grey;
  final Color textSecondaryColor = Colors.black;
  final String prefUserId = 'userId';
  final String prefUserMail = 'userName';
}
