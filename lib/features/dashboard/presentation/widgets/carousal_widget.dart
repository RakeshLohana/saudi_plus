import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:saudi_plus/core/theme/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWithSmoothIndicator extends StatefulWidget {
  @override
  _CarouselWithSmoothIndicatorState createState() =>
      _CarouselWithSmoothIndicatorState();
}

class _CarouselWithSmoothIndicatorState
    extends State<CarouselWithSmoothIndicator> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  final List<String> carouselItems = [
    "https://cdn.pixabay.com/photo/2023/06/20/17/30/youtube-banner-8077450_1280.jpg",
    "https://marketplace.canva.com/EAFh8EnFLW4/1/0/1600w/canva-maroon-and-yellow-modern-food-promotion-banner-landscape-xPGAjV9zPS0.jpg",
    "https://t3.ftcdn.net/jpg/03/35/51/06/360_F_335510693_HY7mLg3ARdLccKoXk3m66NLDpJRJh51p.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: carouselItems.map(
                (url) => Container(
                  height: MediaQuery.of(context).size.height * 0.22,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10), // Optional rounding
              ),
            ),
          )
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            padEnds: true,
            height: MediaQuery.of(context).size.height * 0.22,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // Update the current index
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: PageController(initialPage: _currentIndex),
          count: carouselItems.length,
          effect: ExpandingDotsEffect(
            dotHeight: 6.0,
            dotWidth: 6.0,
            activeDotColor: AppColor.appPrimaryColor,
            dotColor: Colors.grey,
            spacing: 4.0,
            expansionFactor: 3.0,
          ),
          onDotClicked: (index) {
            _controller.animateToPage(index); // Navigate to tapped page
          },
        ),
      ],
    );
  }
}
