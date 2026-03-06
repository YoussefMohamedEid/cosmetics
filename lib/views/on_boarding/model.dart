import 'package:cosmetics/core/designs/images.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List <OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    image: AppImages.onboarding1,
    title: 'WELCOME!',
    description: 'Makeup has the power to transform your mood and empowers you to be a more confident person.',
  ),
  OnBoardingModel(
    image: AppImages.onboarding2,
    title: 'SEARCH & PICK',
    description: 'We have dedicated set of products and routines hand picked for every skin type.',
  ),
  OnBoardingModel(
    image: AppImages.onboarding3,
    title: 'PUCH NOTIFICATIONS',
    description: 'Allow notifications for new makeup & cosmetics offers.',
  ),
];