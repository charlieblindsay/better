import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/constants.dart';
import 'package:bettr_mvp/models/plan_brain.dart';
import 'package:bettr_mvp/screens/final_screen.dart';

class SchedulePlanScreen extends StatefulWidget {
  final int symptomIndex;

  SchedulePlanScreen({@required this.symptomIndex});

  @override
  _SchedulePlanScreenState createState() => _SchedulePlanScreenState();
}

class _SchedulePlanScreenState extends State<SchedulePlanScreen> {
  String selectedFrequencyOption = 'Everyday';
  String selectedTimeOfDay = '0900';

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
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    'Symptom you have chosen to work on:',
                    style: kMainTextBold.copyWith(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Text(
                        '${symptomsList[widget.symptomIndex]}',
                        style: kMainTextBold.copyWith(fontSize: 30),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'which involves a:',
                    style: kMainText.copyWith(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('${symptomsDescriptionsList[widget.symptomIndex]}', style: kMainText.copyWith(fontSize: 18),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Card(
                      child: Container(
                        height: 200,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Select your frequency and time preferences below:', style: kMainText.copyWith(fontSize: 18),),
                          ),
                          Expanded(
                            child: ListTile(leading: Text(
                              'Frequency', style: kMainText.copyWith(fontSize: 20),),
                              trailing:
                              DropdownButton(
                                value: selectedFrequencyOption,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedFrequencyOption = newValue;
                                  });
                                },
                                items: <String>[
                                  'Everyday',
                                  'Once every 2 days',
                                  'Once a fortnite'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),),
                          ),
                          Expanded(
                            child: ListTile(leading: Text('Time of day',
                                style: kMainText.copyWith(fontSize: 20)),
                                trailing:
                                DropdownButton(
                                  value: selectedTimeOfDay,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedTimeOfDay = newValue;
                                    });
                                  },
                                  items: <String>[
                                    '0900',
                                    '1200',
                                    '1500',
                                    '1800'
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )),
                          ),
                        ]),
                      )),
                ),
                ElevatedButton(onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return FinalScreen();
                        }));
                  });
                }, child: Text('Confirm choices'))
            ]))),
    );
  }
}

// Expanded(
//   flex: 1,
// child: DropdownButton<String>(
//     value: selectedFrequencyOption,
//     items: getDropdownMenuItems(),
//     onChanged: (value) {
//       setState(() {
//         selectedFrequencyOption = value;
//       });
//     })
//
