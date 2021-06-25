import 'package:bettr_mvp/screens/schedule_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/constants.dart';
import 'package:bettr_mvp/models/plan_brain.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DesignPlanScreen extends StatefulWidget {
  @override
  _DesignPlanScreenState createState() => _DesignPlanScreenState();
}

class _DesignPlanScreenState extends State<DesignPlanScreen> {
  int counter = 0;

  setSymptomIndex(index) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('symptomIndex', index);
  }

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
                              onPressed: () {
                                setState(() {
                                  setSymptomIndex(index);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SchedulePlanScreen(symptomIndex: index,);
                                  }));
                                });
                              },
                              child: Text('${symptomsList[index]}')),
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
