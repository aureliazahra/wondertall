import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wondertall/pages/home_page.dart';
import 'package:wondertall/widget/slide.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  final Duration _autoPlayIntercal = const Duration(seconds: 4);
  Timer? _timer; 
  int _currentIndex = 0;

  final List<OnboardSlide> _slides = const [
    OnboardSlide(asset: 'assets/images/splash1.png'),
    OnboardSlide(asset: 'assets/images/splash2.png'),
    OnboardSlide(asset: 'assets/images/splash3.png'),
    OnboardSlide(asset: 'assets/images/splash4.png'),
    OnboardSlide(asset: 'assets/images/splash5.png'),
    OnboardSlide(asset: 'assets/images/splash6.png'),
  ];

  @override
  void initState() {
    {
      super.initState();
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    _timer?.cancel();
    _timer = Timer.periodic(_autoPlayIntercal, (timer) {
      if (!mounted) return;
      final nextPage = (_currentIndex + 1) % _slides.length;
      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
      );
    });
  }

  void _goToHome() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
  }

  void _nestOrstart() {
    if (_currentIndex < _slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    final slide = _slides[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: _SegmentedProgress(
                      length: _slides.length,
                      index: _currentIndex,
                      activeColor: const Color(0xFF2F6BFF),
                      inactiveColor: const Color(0xFFE7ECF3),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  TextButton(onPressed: _goToHome, child: const Text('Lewati'))
                ],
              ),
            ),

            Expanded(
              child: SlideCarousel(
                slides: _slides,
                controller: _controller,
                onPageChanged: (i) => setState(() => _currentIndex = i),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SegmentedProgress extends StatelessWidget {
  final int length;
  final int index;
  final Color activeColor;
  final Color inactiveColor;

  const _SegmentedProgress({
    required this.length,
    required this.index,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(length, (i) {
      final isActive = i <= index;
      return Expanded(child: AnimatedContainer(height: 4, 
      margin: EdgeInsets.only(right: i == length - 1 ? 0 : 6),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: isActive ? activeColor : inactiveColor,
        borderRadius: BorderRadius.circular(999)
      ),)
      );
    }),);
  }
}
