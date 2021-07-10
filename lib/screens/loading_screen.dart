import 'package:flutter/material.dart';
import 'package:bettr_mvp/screens/home_screen.dart';
import 'package:bettr_mvp/services/shared_preferences_service.dart';
import 'package:bettr_mvp/services/shared_preferences_service.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {

  bool lessonButtonVisibility;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferencesService sharedPreferences = SharedPreferencesService();
    setState(() {
      sharedPreferences.lessonButtonVisibilityFunction(widget.lessonButtonVisibility);
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
