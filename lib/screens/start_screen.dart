import 'package:bettr_mvp/services/local_notifications_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/screens/home_screen.dart';
import 'package:bettr_mvp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:bettr_mvp/widgets/loading.dart';
import 'package:bettr_mvp/locator.dart';
import 'package:bettr_mvp/services/shared_preferences_service.dart';
import 'package:bettr_mvp/screens/lesson_screen.dart';
import 'package:bettr_mvp/models/lesson_brain.dart';


String welcomeMessage =
    'Well done on taking the first step on the path to getting better...';

class StartScreen extends StatefulWidget {

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalNotificationService.initialize(context);

    FirebaseMessaging.instance.getInitialMessage().then((message) async{
      final sharedPreferencesService =
      locator<SharedPreferencesService>();
      int symptomIndex = await sharedPreferencesService.getSymptomIndex();
      Lesson currentLessonClass = Lesson(symptomIndex: symptomIndex);
      int currentLessonIndex = await currentLessonClass.getCurrentLessonIndex();
      String currentLesson = currentLessonClass.getCurrentLesson(currentLessonIndex);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return LessonScreen(
              symptomIndex: symptomIndex,
              currentLesson: currentLesson,
              // currentLessonIndex: currentLessonIndex,
            );
          }));
    });


    //onMessage is only called when app is in the foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification.body);
        print(message.notification.title);
      }

      LocalNotificationService.display(message);
    });

    //only called when app is in background but open and user taps pn the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
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


    @override
    bool loading = false;

    Widget build(BuildContext context) {
      return loading ? Loading() : Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/image_1.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: kPaddingContainer,
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Better',
                      style: kLogoText.copyWith(fontSize: 48.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 40.0),
                  child: Text(
                    'Welcome'.toUpperCase(),
                    style: kMainText.copyWith(fontSize: 43.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    setState(() => loading = true);
                    final sharedPreferences = locator<
                        SharedPreferencesService>();
                    bool lessonButtonVisibility = await sharedPreferences
                        .lessonButtonVisibilityFunction();
                    setState(() => loading = false);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return HomeScreen(
                            lessonButtonVisibility: lessonButtonVisibility,);
                        }));
                  },
                  child: Text('Start'.toUpperCase(), style: kMainText.copyWith(fontSize: 18.0)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                      foregroundColor: MaterialStateProperty.all(Colors.black)),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
