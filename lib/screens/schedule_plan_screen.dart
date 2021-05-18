import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/constants.dart';
import 'package:bettr_mvp/models/plan_brain2.dart';

class SchedulePlanScreen extends StatefulWidget {
  final int symptomIndex;

  SchedulePlanScreen({@required this.symptomIndex});

  @override
  _SchedulePlanScreenState createState() => _SchedulePlanScreenState();
}

class _SchedulePlanScreenState extends State<SchedulePlanScreen> {
  String selectedFrequencyOption = 'Everyday';

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
            Text('${symptomsList[widget.symptomIndex]}'),
        ])))
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