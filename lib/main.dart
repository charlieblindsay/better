import 'package:bettr_mvp/pages/start_screen.dart';
import 'package:bettr_mvp/locator.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:stacked/stacked.dart';
import 'package:auto_route/auto_route.dart';


Future<void> backgroundHandler(RemoteMessage message) async{
  print(message.notification.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
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