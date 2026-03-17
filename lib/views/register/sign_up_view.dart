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

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

  @override
 void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return GestureDetector(
       onTap: (){
         FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                  FormFieldWidget(hintText: "Your Name",  controller: nameController),
                  SizedBox(height: 30),
                  FormFieldWidget(hintText: "Email",controller:emailController),
                  SizedBox(height: 20),
                  PhoneNumberWidget(phoneController: phoneController),
                  SizedBox(height: 20),
                  PasswordWidget(hintText: "Create Your password"),
                  SizedBox(height: 20),
                  PasswordWidget(hintText: "Confirm password"),
                  SizedBox(height: 20),
                  CustomMainButton(
                    text: "Sign Up",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        GoTo.to(context,  OtpView(
                          isEmail: true,
                          checkThe: emailController.text,
                        ));
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
                          GoTo.to(context, const LoginView());
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
      ),
    );
  }
}
