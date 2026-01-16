import 'package:flutter/material.dart';
import 'package:wondertall/ui/screen/onboarding_screen.dart';

class WondertallApp extends StatelessWidget {
  const WondertallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wondertall',
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}