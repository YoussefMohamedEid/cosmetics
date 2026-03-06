import 'package:flutter/material.dart';

class GoTo {
  // منع إنشاء كائن من هذه الكلاس
  GoTo._();

  // الانتقال إلى شاشة معينة (push)
  static Future<T?> to<T extends Object?>(BuildContext context, Widget page) {
    return Navigator.push<T>(context, MaterialPageRoute(builder: (_) => page));
  }

  // استبدال الشاشة الحالية (pushReplacement)
  static Future<T?> off<T extends Object?, TO extends Object?>(
    BuildContext context,
    Widget page,
  ) {
    return Navigator.pushReplacement<T, TO>(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  // الانتقال وإزالة كل الشاشات السابقة حتى root (pushAndRemoveUntil)
  static Future<T?> offAll<T extends Object?>(
    BuildContext context,
    Widget page,
  ) {
    return Navigator.pushAndRemoveUntil<T>(
      context,
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  // العودة للشاشة السابقة
  static void back<T extends Object?>(BuildContext context, [T? result]) {
    Navigator.pop(context, result);
  }

  // دوال خاصة بشاشات محددة لتسهيل الاستخدام (اختياري)
  // static Future toOnBoarding(BuildContext context) => to(context, const OnBoardingView());
  // static Future toLogin(BuildContext context) => to(context, const LoginView());
  // static Future toHome(BuildContext context) => to(context, const HomeView());

  // يمكن إضافة دوال مع معاملات مثل تمرير بيانات
  // static Future toProductDetails(BuildContext context, {required int productId, String? productName}) {
  //   return to(context, ProductDetailsView(productId: productId, productName: productName));
  // }
}
