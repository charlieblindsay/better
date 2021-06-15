import 'package:bettr_mvp/constants.dart';
import 'package:bettr_mvp/screens/design_plan_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/models/results_brain.dart';
import 'package:bettr_mvp/widgets/linear_progress.dart';
import 'package:bettr_mvp/screens/design_plan_screen.dart';

String resultsMessage =
    'Based on your responses to questions 1-8, you are experiencing some symptoms seen in depression but only an experienced health professional can tell for sure.'
    'You should make an appointment to see your GP for a review or call NHS 111. Both can help you and assess whether you might benefit from extra support or treatment.'
    'Whilst you are waiting for your appointment, why not start improving your symptoms by taking  a look at our courses and designing you own plan!';

class ResultsScreen extends StatelessWidget {
  final int score;

  ResultsScreen({@required this.score});

  final ResultsBrain resultsBrain = ResultsBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/image_1.png'),
              fit: BoxFit.cover,
            )),
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Results'.toUpperCase(),
                      style: kMainTextBold.copyWith(fontSize: 36.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Center(
                  child: Text(
                    'Your score is ${score.toString()} / 27'.toUpperCase(),
                    style: kMainTextBold.copyWith(fontSize: 24.0),
                    textAlign: TextAlign.center,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    VerticalLinearProgress(
                    progressLevel: 0.3, boxHeight: 400.0, boxWidth: 75.0),
                Expanded(
                  flex: 3,
                  child: Column(
                      children: [
                  Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    resultsBrain
                        .getScoreMessage(score: score)
                        .toUpperCase(),
                    style: kMainTextBold.copyWith(
                        fontSize: 26.0, color: Color(0XFF9C8444)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  color: Colors.black26,
                  child: Text(
                    resultsBrain
                        .getScoreMeaning(score: score)
                        .toUpperCase(),
                    style: kMainText.copyWith(
                        color: Colors.white, fontSize: 14.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return DesignPlanScreen();
                          }));
                    },
                    child: Text('Choose plan'),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                                width: 100.0, color: Colors.black))),
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        foregroundColor:
                        MaterialStateProperty.all(Colors.black))),
                ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ],
      ),
    ),)
    );
  }
}
