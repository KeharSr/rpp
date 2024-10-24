import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
