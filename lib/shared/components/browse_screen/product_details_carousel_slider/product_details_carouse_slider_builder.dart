import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/components/browse_screen/product_details_carousel_slider/product_details_carousel_slider_list.dart';
import 'package:taajer/shared/styles/colors.dart';

class ProductDetailsCarouselSliderBuilder extends StatelessWidget {
  const ProductDetailsCarouselSliderBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselSliderController sliderController = CarouselSliderController();
    return Container(
      width: 341.w,
      height: 320.h,
      child: CarouselSlider.builder(
        unlimitedMode: true,
        controller: sliderController,
        slideBuilder: (index) {
          return Image(
            image: AssetImage(productDetailsCarouselSliderItems[index]),
            fit: BoxFit.cover,
          );
        },
        slideIndicator: CircularSlideIndicator(
          indicatorBackgroundColor: const Color(0xFFE2E4E8),
          indicatorRadius: 3.r,
          currentIndicatorColor: figmaPrimaryBlue,
          itemSpacing: 12,
        ),
        itemCount: productDetailsCarouselSliderItems.length,
        initialPage: 0,
        enableAutoSlider: true,
      ),
    );
  }
}
