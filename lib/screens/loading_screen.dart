import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bettr_mvp/screens/home_screen.dart';

class LoadingScreen extends StatefulWidget {

  bool lessonButtonVisibility;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



  Future<void> lessonButtonVisibilityFunction() async{
    final prefs = await SharedPreferences.getInstance();
    final symptomIndex = prefs.getInt('symptomIndex');
    final selectedFrequency = prefs.getInt('frequency');
    final selectedTimeOfDay = prefs.getInt('timeOfDay');
    if(symptomIndex == null || selectedFrequency == null || selectedTimeOfDay == null){
      widget.lessonButtonVisibility = false;
    }
    else{
      widget.lessonButtonVisibility = true;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lessonButtonVisibilityFunction();
    print(widget.lessonButtonVisibility);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
