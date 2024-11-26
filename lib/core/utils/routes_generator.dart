import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saudi_plus/core/constants/route_strings.dart';
import 'package:saudi_plus/core/utils/navigation_animation.dart';
import 'package:saudi_plus/features/dashboard/presentation/pages/main_dashboard.dart';
import 'package:saudi_plus/features/dashboard/presentation/pages/splash_screen.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    log("Route -> ${settings.name}");
    final args = settings.arguments;
    switch (settings.name) {
      case RouteStrings.splash:
        return SwipeLeftAnimationRoute(widget: const ResponsiveWrap(child: SplashScreen()));
      case RouteStrings.mainDashboardScreen:
        return SwipeLeftAnimationRoute(widget: const ResponsiveWrap(child: MainDashboardScreen()));


      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class ResponsiveWrap extends StatelessWidget {
  final Widget child;
  const ResponsiveWrap({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      maxWidth: 1200,
      //background: Container(color: Colors.red),
      child: ResponsiveScaledBox(
        width: ResponsiveValue<double>(context,
            defaultValue: 450,
            conditionalValues: [
              const Condition.equals(name: MOBILE, value: 450),
              const Condition.between(start: 800, end: 1100, value: 830),
              const Condition.between(start: 1000, end: 1200, value: 1030),
            ]).value,
        child:
        BouncingScrollWrapper.builder(context, child, dragWithMouse: true),
      ),
    );
  }
}
