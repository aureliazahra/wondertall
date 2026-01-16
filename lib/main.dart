import 'package:flutter/material.dart';
import 'package:wondertall/app.dart';
import 'package:wondertall/ui/screen/onboarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(WondertallApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wondertall',
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
