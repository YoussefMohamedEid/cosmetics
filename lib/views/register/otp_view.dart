import 'dart:async';

import 'package:cosmetics/core/designs/custom_button.dart';
import 'package:cosmetics/core/designs/images.dart';
import 'package:cosmetics/core/logic/adaptive_app_dimentions.dart';
import 'package:cosmetics/core/logic/adaptive_text.dart';
import 'package:cosmetics/core/logic/colors.dart';
import 'package:cosmetics/core/logic/go_to.dart';
import 'package:cosmetics/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.checkThe, required this.isEmail});
  final String checkThe;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: (){
         FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimensions.screenHeight * 0.035),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: kSemiwhite,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Color(0xff101010),
                        ),
                        onPressed: () {
                          GoTo.back(context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimensions.screenHeight * 0.05),
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
                          text: "We just sent a 4-digit verification code to ",
                        ),
                        TextSpan(
                          text:
                              isEmail
                                  ? "your email address "
                                  : "your phone number ",
                        ),
                        TextSpan(
                          text: checkThe,
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
                        isEmail
                            ? "Edit the email address"
                            : "Edit the phone number",
                        style: TextStyles.smallMov,
                      ),
                    ),
                  ),
                  // استبدال OTPWidget القديم بالجديد
                  const OTPWidget(),
                  SizedBox(height: AppDimensions.screenHeight * 0.04),
                  CustomMainButton(
                    text: "Done",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        GoTo.offAll(context, HomeView());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OTPWidget extends StatefulWidget {
  const OTPWidget({super.key});

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  // Controller لإدارة النص في حقل OTP
  final TextEditingController _otpController = TextEditingController();
  int _secondsRemaining = 60; // الوقت المتبقي بالثواني
  bool _canResend = false; // هل يمكن إعادة الإرسال؟
  Timer? _timer; // كائن المؤقت

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    // _otpController.dispose();
    _timer?.cancel(); // إيقاف المؤقت عند الخروج
    super.dispose();
  }

  void _startTimer() {
    _canResend = false; // نمنع إعادة الإرسال أثناء العد
    _secondsRemaining = 5;
    _timer?.cancel(); // إلغاء أي مؤقت سابق
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true; // عند انتهاء الوقت، يمكن إعادة الإرسال
        });
        timer.cancel(); // إيقاف المؤقت
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // حقل OTP باستخدام pin_code_fields
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: PinCodeTextField(
            validator: (value) {
              if (value == null || value.length != 4) {
                return "Please enter the 4-digit code";
              }
              return null; // إذا كان الإدخال صحيحًا
            },
            appContext: context, // required: السياق
            length: 4, // عدد الخانات
            controller: _otpController, // للتحكم في النص
            onChanged: (value) {
              // يمكنك تنفيذ شيء عند تغيير النص (اختياري)
            },
            onCompleted: (value) {
              // يتم استدعاؤها عند اكتمال الإدخال (امتلاء جميع الخانات)
              print("اكتمل الإدخال: $value");
              _verifyOtpCode(value);
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box, // شكل مربع
              borderRadius: BorderRadius.circular(12),
              fieldHeight: 60,
              fieldWidth: 55,
              borderWidth: 1.5,
              activeColor:
                  kPrimaryMov, // لون الخانة النشطة (التي يتم التركيز عليها)
              inactiveColor: Colors.grey, // لون الخانة غير النشطة
              selectedColor: kPrimaryMov, // لون الخانة عند الضغط عليها
              // يمكنك تفعيل الألوان المملوءة إذا أردت:
              // activeFillColor: kPrimaryMov.withOpacity(0.1),
              // inactiveFillColor: Colors.grey.shade200,
              // selectedFillColor: kPrimaryMov.withOpacity(0.2),
            ),
            keyboardType: TextInputType.number, // لوحة أرقام
            textStyle: TextStyles.mediumDarkBlue, // نمط النص داخل الخانات
            enableActiveFill: false, // إذا جعلتها true ستستخدم fill colors
            autoFocus: true, // أول خانة تحصل على التركيز تلقائياً
            obscureText: false, // لا تخفِ النص
          ),
        ),
        const SizedBox(height: 43),
        Row(
          mainAxisAlignment:
              _canResend
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Didn't receive the code?", style: TextStyles.smallLightBlue),

            _canResend
                ? TextButton(
                  child: Text("Resend now.", style: TextStyles.smallMov),
                  onPressed: () {
                    _resendOtp();
                  },
                )
                : Text(
                  _formatTime(_secondsRemaining), // استخدام الدالة الجديدة
                  style: TextStyles.smallLightBlue,
                ),
          ],
        ),
      ],
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60; // عدد الدقائق
    int remainingSeconds = seconds % 60; // الثواني المتبقية
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _verifyOtpCode(String otp) {
    print("جاري التحقق من الكود: $otp");
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.rightOTP, height: 100),
                const SizedBox(height: 10),
                Text("Account Activated!", style: TextStyles.mediumDarkBlue),
                const SizedBox(height: 10),
                Text(
                  "Congratulations! Your account has been successfully activated.",
                  textAlign: TextAlign.center,
                  style: TextStyles.smallLightBlue,
                ),
                const SizedBox(height: 20),
                CustomMainButton(
                  text: "Go to Home",
                  onPressed: () {
                    GoTo.offAll(context, HomeView());
                  },
                ),
              ],
            ),
          ),
    );
  }

  void _resendOtp() {
    print("تم طلب إعادة الإرسال");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kPrimaryMov,
        content: Text("تم إرسال كود جديد", style: TextStyles.smallWhite),
      ),
    );
    _startTimer();
  }
}
