import 'package:flutter/material.dart';
import 'package:wondertall/core/routes.dart';
import 'package:wondertall/core/theme.dart';
import 'package:wondertall/ui/screen/onboarding_screen.dart';


class WondertallApp extends StatelessWidget {
  const WondertallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wondertall',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialRoute: AppRoutes.onboarding,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}