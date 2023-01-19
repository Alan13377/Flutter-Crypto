import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  const CustomButton({super.key, required this.text, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          bgColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Text(text),
      onPressed: () {},
    );
  }
}
