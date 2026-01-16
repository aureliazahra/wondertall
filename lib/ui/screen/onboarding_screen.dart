import 'package:flutter/material.dart';
import 'dart:async';
import 'package:wondertall/core/constanst.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wondertall/core/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  final Duration autoPlayInterval = const Duration(seconds: 3);
  final Duration slideDuration = const Duration(milliseconds: 500);

  late final List<_ObItem> items = [
    _ObItem(image: Assets.onboarding1),
    _ObItem(image: Assets.onboarding2),
    _ObItem(image: Assets.onboarding3),
    _ObItem(image: Assets.onboarding4),
    _ObItem(image: Assets.onboarding5),
  ];

  int current = 0;
  Timer? _autoTimer;
  bool _pausedByUser = false;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoTimer?.cancel();
    _autoTimer = Timer.periodic(autoPlayInterval, (_) {
      if (!mounted || _pausedByUser) return;
      if (!controller.hasClients) return;
      current = (current + 1) % items.length;
      controller.animateToPage(
        current,
        duration: slideDuration,
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _autoTimer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: items.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 4,
                    dotWidth: 30,
                    spacing: 8,
                    activeDotColor: AppColors.primary,
                    dotColor: Color(0xFFE5E7EB),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Listener(
                onPointerDown: (_) => setState(() {
                  _pausedByUser = true;
                }),
                onPointerUp: (_) => setState(() {
                  _pausedByUser = false;
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        ],
      ),),
    );
  }
}

class _ObItem {
  final String image;
  const _ObItem({required this.image});
}
