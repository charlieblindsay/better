import 'package:bettr_mvp/screens/schedule_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/constants.dart';
import 'package:bettr_mvp/models/plan_brain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bettr_mvp/locator.dart';
import 'package:bettr_mvp/services/shared_preferences_service.dart';
import 'package:bettr_mvp/screens/home_screen.dart';
import 'package:bettr_mvp/screens/lesson_screen.dart';


class DesignPlanScreen extends StatefulWidget {
  @override
  _DesignPlanScreenState createState() => _DesignPlanScreenState();
}

class _DesignPlanScreenState extends State<DesignPlanScreen> {
  int counter = 0;

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
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Better',
                        style: kLogoText.copyWith(fontSize: 36.0),
                      ),
                    ],
                  ),
                  Text(
                    'DESIGN YOUR PLAN',
                    style: kMainTextBold.copyWith(
                        fontSize: 26, color: Color(0XFF0558A5)),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: symptomsList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          title: TextButton(
                              onPressed: () async {
                                final sharedPreferencesService =
                                locator<SharedPreferencesService>();
                                sharedPreferencesService.setSymptomIndex(index);
                                int symptomIndex = await sharedPreferencesService.getSymptomIndex();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return SchedulePlanScreen(
                                        symptomIndex: symptomIndex,
                                      );
                                    }));
                              },
                              child: Text('${symptomsList[index]['symptom']}')),
                          // trailing: Visibility(
                          //     visible: false,
                          //     maintainSize: true,
                          //     maintainAnimation: true,
                          //     maintainState: true,
                          //     child: Text('${brain.planStateList[index]}')),
                        ));
                      })
                ]))));
  }
}
