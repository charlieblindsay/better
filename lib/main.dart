import 'package:bettr_mvp/locator.dart';
import 'package:bettr_mvp/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(BetterApp());
}

class BetterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(),
    );
  }
}