import 'package:flutter/material.dart';
import 'package:flutter_otp_auto_field/flutter_otp_auto_field.dart';
import 'package:flutter_otp_auto_field/otp_service.dart'; // استيرادي للباقة

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber; // رقم الهاتف اللي جاي من الصفحة اللي قبل كده
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  // 1. (اختياري) نبدأ استماع للـ OTP من الرسائل
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
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("أدخل الكود المرسل إلى ${widget.phoneNumber}"),
            const SizedBox(height: 30),

            // 2. استخدام الـ Widget الخاص بالباقة
            FlutterOtpAutoField(
              length: 6, // عدد الخانات
              autoFocus: true, // أول خانة تفتح الكيبورد تلقائي
              onCompleted: (value) {
                // 3. حصل خير، كل الخانات اتملت
                print("اكتمل الإدخال: $value");
                _verifyOtpCode(value); // نوديها لدالة التحقق
              },
              decoration: BoxDecoration( // تخصيص شكل الخانة
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              // في خصائص تانية كتير للتخصيص
              boxWidth: 55,
              boxHeight: 60,
              textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              obscureText: false, // لو عايزاها علامات نجمية
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // دالة إعادة الإرسال
                _resendOtp();
              },
              child: const Text("لم يصلك الكود؟ أعد الإرسال"),
            ),
          ],
        ),
      ),
    );
  }

  // دالة التحقق من OTP
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
      builder: (ctx) => AlertDialog(
        title: Text("تم!"),
        content: Text("تم إدخال الكود: $otp"),
      ),
    );
  }

  void _resendOtp() {
    // هنا هتكتبي منطق إعادة إرسال الكود (استدعاء API تاني)
    print("تم طلب إعادة الإرسال");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("تم إرسال كود جديد")),
    );
  }

  @override
  void dispose() {
    // تنظيف الموارد
    // OtpService مش محتاج dispose لأنه بيتعامل مع Stream داخلياً.
    super.dispose();
  }
}