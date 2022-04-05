import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;

  GlobalButton({
    required this.buttonText,
    required this.onPressed,
  });

  /// Fik t7ot elevated button w fik t7ot l badak yeh w fik testa3mil
  /// container w ta3melo l design w t7otolo [Inkwell] aw [Gesture detector]
  /// w t3ouzo ka button

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 300,
        color: Colors.blue,
        child: Center(
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}
