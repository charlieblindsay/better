import 'package:bettr_mvp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bettr_mvp/constants.dart';
import 'package:bettr_mvp/services/shared_preferences_service.dart';

class FinalScreen extends StatefulWidget {

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  bool loading = false;

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
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Center(
                      child: Text('Well done!'.toUpperCase(),
                          style: kMainTextBold.copyWith(
                              color: Colors.white, fontSize: 36)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Text(
                        'you’ve made your first steps on the path to getting better!'
                            .toUpperCase(),
                        style: kMainTextBold.copyWith(
                            color: Colors.white, fontSize: 36),
                    textAlign: TextAlign.center,),
                  ),
                      TextButton(
                        child: Text(
                          'Return to home screen'.toUpperCase(),
                          style: kMainText.copyWith(fontSize: 18.0),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey),
                            foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                        onPressed: () async{
                          setState(() => loading = true);
                          SharedPreferencesService sharedPreferences = SharedPreferencesService();
                          bool lessonButtonVisibility = await sharedPreferences.lessonButtonVisibilityFunction();
                          setState(() => loading = false);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return HomeScreen(lessonButtonVisibility: lessonButtonVisibility,);
                              }));
                        },
                      ),
                ]))));
  }
}
