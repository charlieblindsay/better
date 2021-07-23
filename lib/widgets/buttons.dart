import 'package:bettr_mvp/constants.dart';
import 'package:flutter/material.dart';

enum ButtonSize { Small, Medium, Large }

Map darkButtonStyleStyles = {
  ButtonSize.Small: {
    'style': ButtonSize.Small,
    'height': 32.0,
    'borderRadius': 8.0,
    'fontSize': 14.0,
    'hPadding': 0.0,
    'vPadding': 0.0,
  },
  ButtonSize.Medium: {
    'style': ButtonSize.Medium,
    'height': 40.0,
    'borderRadius': 8.0,
    'fontSize': 17.0,
    'hPadding': 16.0,
    'vPadding': 8.0,
  },
  ButtonSize.Large: {
    'style': ButtonSize.Large,
    'height': 48.0,
    'borderRadius': 8.0,
    'fontSize': 17.0,
    'hPadding': 16.0,
    'vPadding': 8.0,
  },
};

class CustomWidthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData rightIcon;
  final ButtonSize size;
  final double fontSize;
  final double buttonWidth;
  final Color backgroundColor;
  final Color textColor;
  final bool textBold;

  CustomWidthButton(this.text,
      {@required this.onPressed,
      this.rightIcon,
      @required this.size,
      @required this.fontSize,
      @required this.buttonWidth,
      @required this.textBold,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      child: MaterialButton(
        height: darkButtonStyleStyles[size]['height'],
        elevation: 0,
        color: this.backgroundColor ?? Colors.white,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              darkButtonStyleStyles[size]['borderRadius']),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: darkButtonStyleStyles[size]['vPadding'],
            horizontal: darkButtonStyleStyles[size]['hPadding'],
          ),
          child: Text(text,
              style: textBold
                  ? kMainTextBold.copyWith(
                      fontSize: fontSize, color: textColor ?? Colors.black)
                  : kMainText.copyWith(
                      fontSize: fontSize, color: textColor ?? Colors.black)),
        ),
      ),
    );
  }
}
