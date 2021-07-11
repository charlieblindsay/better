import 'package:flutter/material.dart';
import 'package:bettr_mvp/screens/home_screen.dart';
import 'package:bettr_mvp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:bettr_mvp/widgets/loading.dart';
import 'package:bettr_mvp/locator.dart';
import 'package:bettr_mvp/services/shared_preferences_service.dart';

String welcomeMessage =
    'Well done on taking the first step on the path to getting better...';

class StartScreen extends StatefulWidget {
  // final bool lessonButtonVisibility;
  //
  // HomeScreen({@required this.lessonButtonVisibility});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  bool loading = false;

  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Better',
                    style: kLogoText.copyWith(fontSize: 48.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 40.0),
                child: Text(
                  'Welcome'.toUpperCase(),
                  style: kMainText.copyWith(fontSize: 43.0),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () async {
                  setState(() => loading = true);
                  final sharedPreferences = locator<SharedPreferencesService>();
                  bool lessonButtonVisibility = await sharedPreferences.lessonButtonVisibilityFunction();
                  setState(() => loading = false);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return HomeScreen(lessonButtonVisibility: lessonButtonVisibility,);
                  }));
                },
                child: Text('Start'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    foregroundColor: MaterialStateProperty.all(Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
