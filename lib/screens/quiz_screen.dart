import 'package:bettr_mvp/constants.dart';
import 'package:bettr_mvp/screens/results_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/models/quiz_brain.dart';
import 'package:bettr_mvp/widgets/linear_progress.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizBrain quizBrain = QuizBrain();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quizBrain.createOptionStateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('img/image_2.png'),
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
            Visibility(
                visible: quizBrain.isFirstQuestion(),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 100.0),
                  child: Text(
                    'ok let’s get started'.toUpperCase(),
                    style: kMainTextBold.copyWith(fontSize: 21.0),
                    textAlign: TextAlign.center,
                  ),
                )),
            Text(
              questionIntroStatement.toUpperCase(),
              style: kMainText.copyWith(fontSize: 19.0),
              textAlign: TextAlign.center,
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text(
                  quizBrain.getQuestion().toUpperCase(),
                  style: kMainTextBold.copyWith(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Radio<Option>(
                          value: Option.A,
                          groupValue: quizBrain.getOptionVariable(),
                          onChanged: (value) {
                            setState(() {
                              quizBrain.changeOptionVariable(value);
                            });
                          },
                        ),
                        Text(optionsList[0],
                            style: kMainTextBold.copyWith(fontSize: 14.0),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Radio<Option>(
                          value: Option.B,
                          groupValue: quizBrain.getOptionVariable(),
                          onChanged: (value) {
                            setState(() {
                              quizBrain.changeOptionVariable(value);
                            });
                          },
                        ),
                        Text(optionsList[1],
                            style: kMainTextBold.copyWith(fontSize: 14.0),
                            textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Radio<Option>(
                          value: Option.C,
                          groupValue: quizBrain.getOptionVariable(),
                          onChanged: (value) {
                            setState(() {
                              quizBrain.changeOptionVariable(value);
                            });
                          },
                        ),
                        Text(optionsList[2],
                            style: kMainTextBold.copyWith(fontSize: 14.0),
                            textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Radio<Option>(
                          value: Option.D,
                          groupValue: quizBrain.getOptionVariable(),
                          onChanged: (value) {
                            setState(() {
                              quizBrain.changeOptionVariable(value);
                            });
                          },
                        ),
                        Text(optionsList[3],
                            style: kMainTextBold.copyWith(fontSize: 14.0),
                            textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Row(
                children: [
                  VerticalLinearProgress(
                      progressLevel: 0, boxHeight: 75.0, boxWidth: 15.0),
                  VerticalLinearProgress(
                      progressLevel: 0.3, boxHeight: 75.0, boxWidth: 15.0),
                  VerticalLinearProgress(
                      progressLevel: 0.6, boxHeight: 75.0, boxWidth: 15.0),
                  VerticalLinearProgress(
                      progressLevel: 0.9, boxHeight: 75.0, boxWidth: 15.0),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: LinearProgressIndicator(
                value: 0.1 * (quizBrain.questionNumber) * 10 / 9,
                minHeight: 15.0,
                backgroundColor: Color(0XFFE5E5E5),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0XFF0ACF83),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: !quizBrain.isFirstQuestion(),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        quizBrain.decrementQuestion();
                      });
                    },
                    child: Text('Previous Question'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                  ),
                ),
                OutlinedButton(
                    onPressed: () {
                      if (!quizBrain.quizEnd()) {
                        setState(() {
                          quizBrain.incrementQuestion();
                        });
                      } else {
                        int score = quizBrain.calculateScore();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ResultsScreen(score: score);
                        }));
                      }
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                                width: 100.0, color: Colors.black))),
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    child: Text(quizBrain.nextButtonText())),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
