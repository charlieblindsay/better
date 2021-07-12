import 'package:flutter/material.dart';
import 'package:bettr_mvp/models/plan_brain.dart';
import 'package:bettr_mvp/constants.dart';
import 'package:bettr_mvp/screens/home_screen.dart';

class LessonScreen extends StatefulWidget {
  final int symptomIndex;

  LessonScreen({this.symptomIndex});

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Better',
                        style: kLogoText.copyWith(fontSize: 36.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Text(
                    'Today\'s Lesson',
                    style: kMainTextBold.copyWith(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Color(0XFF323EA8),
                      child: Container(
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '${symptomsList[widget.symptomIndex]} Module',
                                        style: kMainTextBold.copyWith(
                                            color: Colors.white, fontSize: 29),
                                      ),
                                    ),
                                    Expanded(flex: 1, child: SizedBox()),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                            height: 300,
                            child: Column(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 30, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lesson #2',
                                      style: kMainText.copyWith(
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 30, 15, 0),
                                child: Text(
                                  'Today, let\'s try turning our phone off 30-45 minutes before we sleep.',
                                  style: kMainText.copyWith(fontSize: 20),
                                ),
                              ),
                            ]))),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen(
                          lessonButtonVisibility: true,
                        );
                      }));
                    },
                    child: Text('Return home'.toUpperCase(), style: kMainText.copyWith(fontSize: 18.0)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                  )
                ]))));
  }
}
