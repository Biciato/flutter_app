import 'package:aldeia_montessori/widgets/IntroductionCarouselItem.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class IntroductionCarousel extends StatefulWidget {
  @override
  IntroductionCarouselState createState() => IntroductionCarouselState();
}

class IntroductionCarouselState extends State<IntroductionCarousel> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: <int>[1,2,3,4].map((int i) => IntroductionCarouselItem()).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 330,
                  enableInfiniteScroll: false
                ),
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: RaisedButton(
                      color: const Color(0xFFF58634),
                      textColor: Colors.white,
                      onPressed: () => _controller.previousPage(),
                      child: const Text('<'),
                    ),
                  ),
                  Flexible(
                    child: RaisedButton(
                      color: const Color(0xFFF58634),
                      textColor: Colors.white,
                      onPressed: () => _controller.nextPage(),
                      child: const Text('>'),
                    ),
                  )
                ]
              )
            ],
          )
        )
      ]
    );
  }
}