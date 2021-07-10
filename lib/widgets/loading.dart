import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bettr_mvp/constants.dart';

class Loading extends StatelessWidget {
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
          child: Center(child: SpinKitChasingDots()),
        ),
      ),
    );
  }
}
