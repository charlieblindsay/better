import 'package:bettr_mvp/locator.dart';
import 'package:bettr_mvp/screens/start_screen.dart';
import 'package:bettr_mvp/services/local_notifications_service.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'locator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


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