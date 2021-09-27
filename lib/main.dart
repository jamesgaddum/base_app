import 'dart:io';

import 'package:base/application/app.dart';
import 'package:base/application/dev_http_overrides.dart';
import 'package:base/application/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = DevHttpOverrides();
  await Firebase.initializeApp();
  await Services.init();
  runApp(const App());
}
