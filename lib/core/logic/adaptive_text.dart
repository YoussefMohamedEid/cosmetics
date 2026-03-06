
import 'package:cosmetics/core/logic/adaptive_app_dimentions.dart';
import 'package:cosmetics/core/logic/colors.dart';
import 'package:flutter/rendering.dart';



abstract class TextStyles {
  static TextStyle bigDarkBlue = TextStyle(
    color: kPrimaryDarkBlue,
    fontSize: AppDimensions.fontSize(0.08),
    fontWeight: FontWeight.w700,
  );
  static TextStyle mediumDarkBlue = TextStyle(
    color: kPrimaryDarkBlue,
    fontSize: AppDimensions.fontSize(0.05),
    fontWeight: FontWeight.w700,
  );
  static TextStyle smallDarkBlue = TextStyle(
    color: kPrimaryDarkBlue,
    fontSize: AppDimensions.fontSize(0.042),
    fontWeight: FontWeight.w600,
  );
  static TextStyle mediumLightBlue = TextStyle(
    color: kPrimaryLightBlue,
    fontSize: AppDimensions.fontSize(0.05),
    fontWeight: FontWeight.w700,
  );
  static TextStyle smallLightBlue= TextStyle(
    color: kPrimaryLightBlue,
    fontSize: AppDimensions.fontSize(0.04),
    fontWeight: FontWeight.w400,
  );
  static TextStyle smallMov= TextStyle(
    color: kPrimaryMov,
    fontSize: AppDimensions.fontSize(0.04),
    fontWeight: FontWeight.w600,
  );
  static TextStyle smallSemiWhite= TextStyle(
    color: kSemiwhite,
    fontSize: AppDimensions.fontSize(0.042),
    fontWeight: FontWeight.w600,
  );
  static TextStyle smallWhite= TextStyle(
    color: kWhite,
    fontSize: AppDimensions.fontSize(0.042),
    fontWeight: FontWeight.w600,
  );

  static var largeMov;
  
}