import 'package:flutter/material.dart';

class VerticalLinearProgress extends StatelessWidget {
  final double progressLevel;
  final double boxHeight;
  final double boxWidth;

  VerticalLinearProgress(
      {@required this.progressLevel,
      @required this.boxHeight,
      @required this.boxWidth});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: boxHeight,
              width: boxWidth,
              child: RotatedBox(
                quarterTurns: -1,
                child: LinearProgressIndicator(
                  value: progressLevel,
                  backgroundColor: Color(0XFFE5E5E5),
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0XFF1A8982)),
                ),
              )),
        ],
      ),
    );
  }
}
