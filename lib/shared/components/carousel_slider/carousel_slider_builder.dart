import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/components/carousel_slider/carousel_slider_list.dart';

class CarouselSliderBuilder extends StatelessWidget {
  const CarouselSliderBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselSliderController sliderController = CarouselSliderController();
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        width: 343.w,
        height: 160.h,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(6.r),
        //   color: Colors.white,
        // ),
        child: CarouselSlider.builder(
          unlimitedMode: true,
          controller: sliderController,
          slideBuilder: (index) {
            return Image(
              image: AssetImage(carouselSliderItems[index]),
              fit: BoxFit.cover,
            );
          },
          slideIndicator: CircularSlideIndicator(
            padding: const EdgeInsets.only(bottom: 5),
            //indicatorBorderColor: Colors.white,
            indicatorBackgroundColor: Colors.white.withOpacity(0.5),
            indicatorRadius: 3.r,
            currentIndicatorColor: Colors.white,
            itemSpacing: 12,
          ),
          itemCount: carouselSliderItems.length,
          initialPage: 0,
          enableAutoSlider: true,
        ),
      ),
    );
  }
}
