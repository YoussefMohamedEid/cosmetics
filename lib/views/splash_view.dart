import 'package:cosmetics/core/designs/images.dart';
import 'package:cosmetics/core/logic/adaptive_app_dimentions.dart';
import 'package:cosmetics/core/logic/go_to.dart';
import 'package:cosmetics/views/on_boarding/onboaring_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      GoTo.off(context, const OnBoardingView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              width: AppDimensions.imageWidth(0.65),
            ),
            const SizedBox(height: 16),
            Image.asset(
              AppImages.logoName,
              width: AppDimensions.imageWidth(0.4),
            ),
          ],
        ),
      ),
    );
  }
}
