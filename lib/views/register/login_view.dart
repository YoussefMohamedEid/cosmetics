import 'package:cosmetics/core/designs/custom_button.dart';
import 'package:cosmetics/core/designs/images.dart';
import 'package:cosmetics/core/logic/adaptive_app_dimentions.dart';
import 'package:cosmetics/core/logic/adaptive_text.dart';
 import'package:cosmetics/core/logic/go_to.dart';
import 'package:cosmetics/views/register/sign_up_view.dart';
import 'package:cosmetics/views/register/widgets/password.dart';
import 'package:cosmetics/views/register/widgets/phone_number.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppDimensions.screenHeight * 0.1),
                Image.asset(
                  AppImages.login,
                  width: AppDimensions.imageHeight(0.35),
                ),
                SizedBox(height: 25),
                Text("Login Now", style: TextStyles.bigDarkBlue),
                SizedBox(height: 14),
                Text(
                  "Please login to your account to continue using our app",
                  style: TextStyles.smallLightBlue,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 18),
                PhoneNumberWidget(),
                SizedBox(height: 6),
                PasswordWidget(),
                SizedBox(height: 6),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "Forgot your password?",
                      style: TextStyles.smallMov,
                    ),

                    onPressed: () {
                      // Handle forgot password logic here
                    },
                  ),
                ),
                SizedBox(height: 24),
                CustomMainButton(
                  text: "Login",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      GoTo.to(context, const SignUpView());
                    }
                  },
                ),
                SizedBox(height: AppDimensions.screenHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyles.smallLightBlue,
                    ),
                    TextButton(
                      child: Text("Sign Up", style: TextStyles.smallMov),
                      onPressed: () {
                        GoTo.to(context, const SignUpView());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
