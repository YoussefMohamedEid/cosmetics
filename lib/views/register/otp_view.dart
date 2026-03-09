import 'package:cosmetics/core/designs/custom_button.dart';
import 'package:cosmetics/core/designs/images.dart';
import 'package:cosmetics/core/logic/adaptive_app_dimentions.dart';
import 'package:cosmetics/core/logic/adaptive_text.dart';
import 'package:cosmetics/core/logic/colors.dart';
import 'package:cosmetics/core/logic/go_to.dart';
import 'package:cosmetics/views/home/home_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_auto_field/flutter_otp_auto_field.dart';
import 'package:flutter_otp_auto_field/otp_service.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
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
                    "Edit the phone number",
                    style: TextStyles.smallMov,
                  ),
                ),
              ),
              OTPWidget(),
              SizedBox(height: AppDimensions.screenHeight * 0.04),
            ],
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
  @override
  void initState() {
    super.initState();
    _initializeOtpListener();
  }

  void _initializeOtpListener() {
    try {
      OtpService().init(); // بدأ الاستماع
      OtpService().otpStream.listen((otp) {
        print("تم استقبال OTP تلقائياً: $otp");
        // هنا هيدخل الكود لوحده في الخانات! الباقة بتشتغل مع الـ Stream.
        // مش محتاجة تعملي حاجة.
      });
    } catch (e) {
      print("خطأ في بدء الاستماع: $e"); // لو في مشكلة (زي ما يكون في SDK)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 2. استخدام الـ Widget الخاص بالباقة
        FlutterOtpAutoField(
          length: 4, // عدد الخانات
          //autoFocus: true, // أول خانة تفتح الكيبورد تلقائي
          onCompleted: (value) {
            // 3. حصل خير، كل الخانات اتملت
            print("اكتمل الإدخال: $value");
            _verifyOtpCode(value); // نوديها لدالة التحقق
          },
          decoration: BoxDecoration(
            // تخصيص شكل الخانة
            border: Border.all(color: kPrimaryMov),
            borderRadius: BorderRadius.circular(12),
          ),
          // في خصائص تانية كتير للتخصيص
          boxWidth: 55,
          boxHeight: 60,
          textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          obscureText: false, // لو عايزاها علامات نجمية
        ),
        const SizedBox(height: 43),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Didn't receive the code?", style: TextStyles.smallLightBlue),
            TextButton(
              child: Text("Resend now.", style: TextStyles.smallMov),
              onPressed: () {
                _resendOtp();
              },
            ),
          ],
        ),
      ],
    );
  }

  void _verifyOtpCode(String otp) {
    // هنا هتكتبي المنطق بتاعك، زي:
    // 1. عرض مؤشر تحميل.
    // 2. استدعاء API للتأكد من الكود.
    // 3. لو صح، تروحي للصفحة الجاية.
    // 4. لو غلط، تظهر رسالة خطأ.
    print("جاري التحقق من الكود: $otp");
    // مثال بسيط:
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
                    GoTo.offAll(context,HomeView());
                  },
                ),
              ],
            ),
          ),
    );
  }

  void _resendOtp() {
    // هنا هتكتبي منطق إعادة إرسال الكود (استدعاء API تاني)
    print("تم طلب إعادة الإرسال");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kPrimaryMov,
        content: Text("تم إرسال كود جديد", style: TextStyles.smallWhite),
      ),
    );
  }
}
