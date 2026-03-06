import 'package:cosmetics/core/designs/custom_button.dart';
import 'package:cosmetics/core/designs/images.dart';
import 'package:cosmetics/core/logic/adaptive_app_dimentions.dart';
import 'package:cosmetics/core/logic/adaptive_text.dart';
import 'package:cosmetics/core/logic/go_to.dart';
import 'package:cosmetics/views/register/login_view.dart';
import 'package:cosmetics/views/register/otp_view.dart';
import 'package:cosmetics/views/register/widgets/form_field_widget.dart';
import 'package:cosmetics/views/register/widgets/password.dart';
import 'package:cosmetics/views/register/widgets/phone_number.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SizedBox(height: AppDimensions.screenHeight * 0.08),
                Image.asset(
                  AppImages.logo,
                  height: AppDimensions.screenHeight * 0.12,
                ),
                SizedBox(height: 10),
                Text("Create Account", style: TextStyles.bigDarkBlue),
                SizedBox(height: 50),
                FormFieldWidget(hintText: "Your Name"),
                SizedBox(height: 30),
                FormFieldWidget(hintText: "Email"),
                SizedBox(height: 20),
                PhoneNumberWidget(),
                SizedBox(height: 20),
                PasswordWidget(hintText: "Create Your password"),
                SizedBox(height: 20),
                PasswordWidget(hintText: "Confirm password"),
                SizedBox(height: 20),
                CustomMainButton(
                  text: "Sign Up",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      GoTo.to(context, const OtpView());
                    }
                  },
                ),
                SizedBox(height: AppDimensions.screenHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Have an account?", style: TextStyles.smallLightBlue),
                    TextButton(
                      child: Text("Login", style: TextStyles.smallMov),
                      onPressed: () {
                        GoTo.to(context, const OtpView());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
