import 'package:flutter/material.dart';
import 'package:bettr_mvp/constants.dart';

class FinalScreen extends StatelessWidget {
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
                  )
                ]))));
  }
}
