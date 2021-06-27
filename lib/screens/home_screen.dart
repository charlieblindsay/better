import 'package:bettr_mvp/constants.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/screens/quiz_screen.dart';
import 'package:bettr_mvp/screens/lesson_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String welcomeMessage =
    'Well done on taking the first step on the path to getting better...';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool lessonButtonVisibility = true;
  int symptomIndex2;
  String frequency;
  String timeOfDay;

  Future<void> lessonButtonVisibilityFunction() async{
    final prefs = await SharedPreferences.getInstance();
    final symptomIndex = prefs.getInt('symptomIndex');
    final selectedFrequency = prefs.getInt('frequency');
    final selectedTimeOfDay = prefs.getInt('timeOfDay');
    if(symptomIndex == null || selectedFrequency == null || selectedTimeOfDay == null){
      lessonButtonVisibility = false;
    }
    else{
      lessonButtonVisibility = true;
    }
  }

  Future<void> _getSymptomIndex() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
        symptomIndex2 = prefs.getInt('symptomIndex');
        frequency = prefs.getString('frequency');
        timeOfDay = prefs.getString('timeOfDay');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lessonButtonVisibilityFunction();
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
                  Visibility(
                    visible: lessonButtonVisibility,
                    child: TextButton(
                        child: Text(
                          'See daily lesson'.toUpperCase(),
                          style: kMainText.copyWith(fontSize: 18.0),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey),
                            foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                        onPressed: () {
                          _getSymptomIndex();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LessonScreen(symptomIndex:symptomIndex2, frequency: frequency, timeOfDay: timeOfDay,);
                          }));
                        }),
                  ),
                  TextButton(
                    child: Text(
                      'Screen yourself'.toUpperCase(),
                      style: kMainText.copyWith(fontSize: 18.0),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return QuizScreen();
                      }));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
