import 'package:flutter/material.dart';
import 'dart:async';
import 'package:wondertall/core/constanst.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wondertall/core/theme.dart';
import 'package:wondertall/ui/widgets/primary_button.dart';
import 'package:wondertall/core/routes.dart';

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
                alignment: Alignment.center,
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
                child: PageView.builder(
                  controller: controller,
                  itemCount: items.length,
                  onPageChanged: (i) => setState(() => current = i),
                  itemBuilder: (_, i) => _page(items[i]),
                ),
              ),
            ),
            
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: const [
                    Text(
                      'Adventure awaits out there\nstart your journey today!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        height: 1.35,
                        fontWeight: FontWeight.w700,
                        color: AppColors.text,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Begin your journey into a world full of adventure, culture, and hidden wonders waiting to be found.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              label: 'Get Started',
              trailing: Icons.arrow_forward_rounded,
              onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.signin),
            ),
            const SizedBox(height: 14),
            const Text(
              'Dengan melanjutkan, kamu setuju bahwa pihak lain memakai data aplikasi untuk meningkatkan pengalaman di aplikasi.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _page(_ObItem item) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Column(
        children: [
          // Bagian gambar (yang auto-slide)
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(item.image, height: 320, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),
          
        ],
      ),
    );
  }
}

class _ObItem {
  final String image;
  const _ObItem({required this.image});
}
