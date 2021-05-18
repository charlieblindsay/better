import 'package:flutter/material.dart';

List<String> symptomsList = [
  'Anhedonia',
  'Low mood',
  'Low energy',
  'Sleep',
  'Appetite',
  'Anxiety',
  'Self Esteem',
  'Loss of libido',
  'Isolation',
  'Physical Pain'
];

List<String> symptomsDescriptionsList = [
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  '14 lesson course teaching you how to create sustained improved change in your mood',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  '14 lesson course aimed at improving sleep quality and sleeping practices',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
];

List<String> frequencyOptions = [
  'Everyday',
  'Once every 2 days',
  'Once a fortnite'
];

// List<DropdownMenuItem<String>> getDropdownMenuItems() {
//   List<DropdownMenuItem<String>> dropDownItems = [];
//   for (String option in frequencyOptions) {
//     var menuItem = DropdownMenuItem(child: Text(option), value: option);
//     dropDownItems.add(menuItem);
//   }
//
//   return dropDownItems;
// }

// List<Text<String>> getCupertinoItems() {
//   List<Text<String>> cupertinoItems = [];
//   for (String option in frequencyOptions){
//     cupertinoItems.add(Text('$option'))
//   }
//
//   return cupertinoItems;
// }

class PlanBrain {
  List<int> planStateList = [];

  void createOptionStateList() {
    for (int state in List<int>.generate(10, (i) => i)) {
      int preference = 0;
      planStateList.add(preference);
    }
  }

  int plansSelected = 0;

  bool checkSelect({int index}) {
    if (planStateList[index] == 0) {
      return false;
    } else {
      return true;
    }
  }

  void selectionNumberIncremented({int index}) {
    plansSelected++;
    planStateList[index] = plansSelected;
  }

  void selectionNumberDecremented({int index}) {
    plansSelected--;
    planStateList[index] = 0;
  }
}
