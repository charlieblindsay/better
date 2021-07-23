import 'package:bettr_mvp/widgets/buttons.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:bettr_mvp/services/local_notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/pages/home_screen.dart';
import 'package:bettr_mvp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:bettr_mvp/widgets/loading.dart';
import 'package:bettr_mvp/locator.dart';
import 'package:bettr_mvp/services/shared_preferences_service.dart';
import 'package:bettr_mvp/pages/lesson_screen.dart';
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

    

    //onMessage is only called when app is in the foreground
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.display(message);
    });

    //only called when app is in background but open and user taps pn the notification
    FirebaseMessaging.instance.getInitialMessage().then((message) async{
      final sharedPreferencesService = locator<SharedPreferencesService>();
      int symptomIndex = await sharedPreferencesService.getSymptomIndex();
      Lesson lessonClass = Lesson();
      int currentLessonIndex = await lessonClass.getCurrentLessonIndex();
      String currentLesson = lessonClass.getCurrentLesson(currentLessonIndex);
      LocalNotificationService.display(message);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return LessonScreen(
              symptomIndex: symptomIndex,
              currentLesson: currentLesson,
              // currentLessonIndex: currentLessonIndex,
            );
          }));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      final sharedPreferencesService = locator<SharedPreferencesService>();
      int symptomIndex = await sharedPreferencesService.getSymptomIndex();
      Lesson lessonClass = Lesson();
      int currentLessonIndex = await lessonClass.getCurrentLessonIndex();
      String currentLesson = lessonClass.getCurrentLesson(currentLessonIndex);
      LocalNotificationService.display(message);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return LessonScreen(
              symptomIndex: symptomIndex,
              currentLesson: currentLesson,
              // currentLessonIndex: currentLessonIndex,
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
              // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                CustomWidthButton(
                  'Start',
                  textBold: false,
                  buttonWidth: 200.0,
                  fontSize: 30.0,
                  size: ButtonSize.Large,
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
                )
              ],
            ),
          ),
        ),
      );
    }
  }
