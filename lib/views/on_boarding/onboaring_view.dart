import 'package:cosmetics/core/designs/custom_button.dart';
import 'package:cosmetics/core/logic/adaptive_app_dimentions.dart';
import 'package:cosmetics/core/logic/colors.dart';
import 'package:cosmetics/core/logic/adaptive_text.dart';
import 'package:cosmetics/core/logic/go_to.dart';
import 'package:cosmetics/views/register/login_view.dart';
import 'package:cosmetics/views/on_boarding/model.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  currentPage = index;
                  print('Current Page: $currentPage');
                  setState(() {}); // تحديث الواجهة لعرض الزر المناسب
                },

                children: [
                  PageViewItem(pageItemData: onBoardingData[0]),
                  PageViewItem(pageItemData: onBoardingData[1]),
                  PageViewItem(pageItemData: onBoardingData[2]),
                ],
              ),
            ),
            SizedBox(height: 30),
            currentPage != 2
                ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(16),
                    backgroundColor: kPrimaryDarkBlue, // Button color
                  ),
                  onPressed: () {
                    // الانتقال إلى الصفحة التالية
                    currentPage++;
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                )
                : CustomMainButton(
                  buttonColor: kPrimaryDarkBlue,
                  text: 'Let\'s Start!',
                  onPressed: () {
                    // Transfer to login:
                    GoTo.offAll(context, const LoginView());
                  },
                ),
            SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pageItemData});
  final OnBoardingModel pageItemData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
             GoTo.offAll(context, const LoginView());
            },
            child: Text('Skip', style: TextStyles.smallLightBlue),
          ),
        ),
        SizedBox(height: 78),
        Image.asset(pageItemData.image, width: AppDimensions.imageWidth(0.8)),

        SizedBox(height: 28),
        Text(
          pageItemData.title,
          style: TextStyles.bigDarkBlue,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          pageItemData.description,
          style: TextStyles.smallLightBlue,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
