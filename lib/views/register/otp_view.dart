import 'package:cosmetics/core/designs/images.dart';
import 'package:cosmetics/core/logic/adaptive_app_dimentions.dart';
import 'package:cosmetics/core/logic/adaptive_text.dart';
import 'package:cosmetics/core/logic/go_to.dart';
import 'package:flutter/material.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: AppDimensions.screenHeight * 0.12),
            Image.asset(
              AppImages.logo,
              height: AppDimensions.screenHeight * 0.12,
            ),
            SizedBox(height: 40),
            Text("Verify code", style: TextStyles.bigDarkBlue),
            SizedBox(height: 40),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyles.smallLightBlue,
                children: [
                  TextSpan(
                    text:
                        "We just sent a 4-digit verification code to your email ",
                  ),
                  TextSpan(
                    text: "amramer522@gmail.com",
                    style: TextStyles.smallLightBlue.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ". Enter the code in the box below to continue.",
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  GoTo.back(context);
                },
                child: Text(
                  "Edit the email address",
                  style: TextStyles.smallMov,
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
