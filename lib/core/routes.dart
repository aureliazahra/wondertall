import 'package:flutter/material.dart';
import 'package:wondertall/ui/screen/destination_detail_screen.dart';
import 'package:wondertall/ui/screen/home_screen.dart';
import 'package:wondertall/ui/screen/onboarding_screen.dart';
import 'package:wondertall/ui/screen/signin_screen.dart';


class AppRoutes {
  static const onboarding = '/';
  static const signin = '/signin';
  static const home = '/home';
  static const detail = 'detail';

  static Map<String, WidgetBuilder> routes = {
    onboarding: (_) => const OnboardingScreen(),
    signin: (_) => const SigninScreen(),
    home: (_) => const HomeScreen();
  };
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  if (settings.name == AppRoutes.detail) {
    final dest = settings.arguments as Destination;
    return MaterialPageRoute(
      builder: (_) => DestinationDetailScreen(destination: dest),
    );
  }
  return null;
}
