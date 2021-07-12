import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:bettr_mvp/locator.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/services/shared_preferences_service.dart';
import 'package:bettr_mvp/screens/lesson_screen.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationsPlugin.initialize(initializationSettings,onSelectNotification: (String route) async{
      final sharedPreferencesService =
      locator<SharedPreferencesService>();
      int symptomIndex = await sharedPreferencesService.getSymptomIndex();
      List<String> schedulingList = await sharedPreferencesService
          .getScheduling();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return LessonScreen(
              symptomIndex: symptomIndex,
            );
          }));
    });
  }

  static void display(RemoteMessage message) async {

    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "better",
            "better channel",
            "this is our channel",
            importance: Importance.max,
            priority: Priority.high,
          )
      );


      await _notificationsPlugin.show(
        id,
        message.notification.title,
        message.notification.body,
        notificationDetails,
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}