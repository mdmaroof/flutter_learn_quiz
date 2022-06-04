import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressFunction;
  final String buttonTitle;
  Answer(this.onPressFunction, this.buttonTitle);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: onPressFunction,
        child: Text(buttonTitle),
      ),
    );
  }
}
