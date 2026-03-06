import 'package:cosmetics/core/logic/adaptive_text.dart';
import 'package:cosmetics/core/logic/colors.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({
    super.key,
    this.onPressed,
    required this.text,
    this.buttonColor = kPrimaryMov,
  });

  final void Function()? onPressed;
  final String text;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          padding: EdgeInsets.all(20),
          backgroundColor: buttonColor, // Button color
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyles.smallSemiWhite),
      ),
    );
  }
}
