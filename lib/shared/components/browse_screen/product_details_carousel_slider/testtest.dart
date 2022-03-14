import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_cubit.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_states.dart';
import 'package:taajer/shared/components/browse_screen/product_details_carousel_slider/product_details_carousel_slider_list.dart';
import 'package:taajer/shared/styles/colors.dart';

class TestTest extends StatelessWidget {
  TestTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BrowseCubit cubit = BrowseCubit.get(context);
    return BlocBuilder<BrowseCubit, BrowseStates>(
      builder: (BuildContext context, state) => Column(
        children: [
          SizedBox(
            width: 341.w,
            height: 250.h,
            child: CarouselSlider.builder(
              itemBuilder: (BuildContext context, int index, int realIndex) =>
                  Image(
                image: AssetImage(productDetailsCarouselSliderItems[index]),
                fit: BoxFit.cover,
              ),
              itemCount: productDetailsCarouselSliderItems.length,
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayAnimationDuration: const Duration(seconds: 3),
                pauseAutoPlayOnTouch: true,
                pauseAutoPlayOnManualNavigate: true,
                reverse: false,
                onPageChanged: (int index, CarouselPageChangedReason r) {
                  cubit.currentIndex = index.toDouble();
                  print(cubit.currentIndex);
                  cubit.emit(BrowseStateRefreshState());
                },
              ),
            ),
          ),
          DotsIndicator(
            dotsCount: productDetailsCarouselSliderItems.length,
            position: cubit.currentIndex ?? 0,
            decorator: DotsDecorator(
              color: const Color(0xFFE2E4E8),
              activeColor: figmaPrimaryBlue,
              size: const Size(4, 4),
              activeSize: const Size(13, 4),
              spacing: const EdgeInsets.all(4),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
