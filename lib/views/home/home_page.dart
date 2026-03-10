import 'package:cosmetics/core/designs/icons.dart';
import 'package:cosmetics/core/designs/images.dart';
import 'package:cosmetics/core/logic/adaptive_text.dart' show TextStyles;
import 'package:cosmetics/core/logic/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      imagePath: AppImages.ads,
      name: 'Face tint / lip tint',
      price: 10.99,
    ),
    Product(imagePath: AppImages.ads, name: "Athe Red lipstick", price: 15.49),
    Product(
      imagePath: AppImages.ads,
      name: 'Face tint / lip tint Face tint / lip tint',
      price: 7.99,
    ),
    Product(
      imagePath: AppImages.ads,
      name: 'Face tint / lip tint',
      price: 7.99,
    ),
    // ... المزيد
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            suffixIcon: SvgPicture.asset(
              AppIcons.search,
              color: kPrimaryDarkBlue,
              fit: BoxFit.scaleDown,
            ),
            labelText: 'Search',
            labelStyle: TextStyles.smallDarkBlue,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryDarkBlue),
              borderRadius: BorderRadius.circular(26),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryDarkBlue),
              borderRadius: BorderRadius.circular(26),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryDarkBlue, width: 2),
              borderRadius: BorderRadius.circular(26),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              SizedBox(height: 20),
              Image.asset(AppImages.ads, fit: BoxFit.cover),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Top rated products",
                  style: TextStyles.mediumDarkBlue,
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // عدد الأعمدة
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio:
                      0.7, // نسبة الارتفاع إلى العرض (يمكن تعديلها)
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductGridItem(
                    product: products[index],
                    onAddToCart: () {
                      // هنا ضع منطق إضافة المنتج إلى السلة
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kPrimaryMov,
                          content: Text(
                            'تمت إضافة ${products[index].name} إلى السلة',style: TextStyles.smallWhite,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductGridItem extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart; // دالة عند الضغط على أيقونة السلة

  const ProductGridItem({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kWhite,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الجزء العلوي: الصورة مع زر السلة
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  // الصورة
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      product.imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // أيقونة السلة (مربع أبيض في الزاوية اليمنى العلوية)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: onAddToCart,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 18,
                          color: kPrimaryMov,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // الجزء السفلي: الاسم والسعر
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.name,
                      style: TextStyles.mediumDarkBlue,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyles.smallLightBlue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String imagePath;
  final String name;
  final double price;

  Product({required this.imagePath, required this.name, required this.price});
}
