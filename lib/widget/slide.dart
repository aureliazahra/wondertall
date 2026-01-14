import 'package:flutter/material.dart';

class OnboardSlide {
  final String asset;

  const OnboardSlide({required this.asset});
}

class SlideCarousel extends StatelessWidget {
  final List<OnboardSlide> slides;
  final PageController controller;
  final ValueChanged<int>? onPageChanged;
  final ScrollPhysics physics;

  const SlideCarousel({super.key, required this.slides, required this.controller, this.onPageChanged, this.physics = const BouncingScrollPhysics(),});
  

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: slides.length,
      physics: physics,
      itemBuilder: (context, index) {
        return _SlideImageItem(data: slides[index]);
      }
    );
  }
  
}

class _SlideImageItem extends StatelessWidget {

  final OnboardSlide data;
  const _SlideImageItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    child: Column(
      children: [
        const SizedBox(height: 8,),
        Expanded(
          child: ClipRRect(borderRadius: BorderRadiusGeometry.circular(10),
          child: Container(
            color: const Color(0xFFF5F7FB),
            alignment: Alignment.center,
            child: Image.asset(
              data.asset,
              fit: BoxFit.contain,
            ),
          ),
        ))
      ],
    ),);
  }
}