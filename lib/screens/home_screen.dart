import 'package:bettr_mvp/constants.dart';
import 'package:bettr_mvp/screens/design_plan_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/screens/quiz_screen.dart';
import 'package:bettr_mvp/screens/lesson_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bettr_mvp/locator.dart';
import 'package:bettr_mvp/services/shared_preferences_service.dart';
import 'package:bettr_mvp/models/lesson_brain.dart';

String welcomeMessage =
    'Well done on taking the first step on the path to getting better...';

class HomeScreen extends StatefulWidget {
  final bool lessonButtonVisibility;

  HomeScreen({this.lessonButtonVisibility});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Below are the variables to store information about the user's lesson and scheduling
  //preferences. These will be accessed using shared preferences

  int bottomNavIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text(
                welcomeMessage.toUpperCase(),
                style: kMainText.copyWith(fontSize: 19.0),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'Screen yourself'.toUpperCase(),
                        style: kMainText.copyWith(fontSize: 18.0),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.grey),
                          foregroundColor:
                          MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return QuizScreen();
                            }));
                      },
                    ),
                    Visibility(
                      visible: widget.lessonButtonVisibility,
                      child: TextButton(
                          child: Text(
                            'See daily lesson'.toUpperCase(),
                            style: kMainText.copyWith(fontSize: 18.0),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          onPressed: () async {
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
                                currentLessonIndex: currentLessonIndex,
                              );
                            }));
                          }),
                    ),
                    Visibility(
                      visible: widget.lessonButtonVisibility,
                      child: TextButton(
                          child: Text(
                            'Change your course'.toUpperCase(),
                            style: kMainText.copyWith(fontSize: 18.0),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                              foregroundColor:
                              MaterialStateProperty.all(Colors.black)),
                          onPressed: () async {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return DesignPlanScreen();
                                }));
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        onTap: (index) {
          setState(() {
            bottomNavIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), label: 'Daily lesson'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_module), label: 'Courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services), label: 'Screen yourself'),
        ],
      ),
    );
  }
}
