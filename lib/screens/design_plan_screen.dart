import 'package:bettr_mvp/screens/schedule_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/constants.dart';
import 'package:bettr_mvp/models/plan_brain2.dart';



class DesignPlanScreen extends StatefulWidget {
  @override
  _DesignPlanScreenState createState() => _DesignPlanScreenState();
}

class _DesignPlanScreenState extends State<DesignPlanScreen> {
  int counter = 0;
  PlanBrain planBrain = PlanBrain();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    planBrain.createOptionStateList();
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
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SchedulePlanScreen(symptomIndex: index,);
                                  }));
                                });
                              },
                              child: Text('${symptomsList[index]}')),
                          trailing: Visibility(
                              visible: false,
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Text('${planBrain.planStateList[index]}')),
                        ));
                      })
                ]))));
  }
}

// if (planBrain.planStateList[index] == 0) {
// planBrain.plansSelected++;
// planBrain.planStateList[index] =
// planBrain.plansSelected;
// } else {
// planBrain.plansSelected--;
// for (int i in planBrain.planStateList) {
// print('hello');
// if (i != 0) {
// i = 0;
// }
// }
// planBrain.planStateList[index] = 0;
// }