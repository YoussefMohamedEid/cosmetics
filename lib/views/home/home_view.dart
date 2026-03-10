import 'package:cosmetics/core/designs/icons.dart';
import 'package:cosmetics/core/logic/colors.dart';
import 'package:cosmetics/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
     HomePage(

    ),
    const Center(child: Text("صفحة البحث")),
    const Center(child: Text("صفحة السلة")),
    const Center(child: Text("صفحة الملف الشخصي")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationButton(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 13, right: 13),
          child: _pages[_selectedIndex],
        ),
      ),
    );
  }
}

class CustomNavigationButton extends StatelessWidget {
  const CustomNavigationButton({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 13, right: 13),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          color: kWhite,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                AppIcons.homeNav,
                // يمكنك تغيير الأيقونة حسب الحالة
                color: currentIndex == 0 ? kPrimaryMov : kPrimaryLightBlue,
              ),
              onPressed: () => onTap(0),
              color: currentIndex == 0 ? kPrimaryMov : kPrimaryLightBlue,
            ),
            IconButton(
              icon: SvgPicture.asset(
                AppIcons.categoryNav,
                color: currentIndex == 1 ? kPrimaryMov : kPrimaryLightBlue,
              ),
              onPressed: () => onTap(1),
              color: currentIndex == 1 ? kPrimaryMov : kPrimaryLightBlue,
            ),
            IconButton(
              icon: SvgPicture.asset(
                AppIcons.cartNav,
                color: currentIndex == 2 ? kPrimaryMov : kPrimaryLightBlue,
              ),
              onPressed: () => onTap(2),
              color: currentIndex == 2 ? kPrimaryMov : kPrimaryLightBlue,
            ),
            IconButton(
              icon: SvgPicture.asset(
                AppIcons.profileNav,
                color: currentIndex == 3 ? kPrimaryMov : kPrimaryLightBlue,
              ),
              onPressed: () => onTap(3),
              color: currentIndex == 3 ? kPrimaryMov : kPrimaryLightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
