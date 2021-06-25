import 'package:flutter/material.dart';
import 'package:bettr_mvp/models/plan_brain.dart';

class LessonScreen extends StatefulWidget {

  final int index;

  LessonScreen({@required this.index});

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(symptomsList[widget.index]),
    );
  }
}
