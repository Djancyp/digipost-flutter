import 'package:digipost/pages/not_found.dart';
import 'package:digipost/pages/onboarding.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  /// The Initial Page
  static const onboarding = '/onboarding';
}

class RouteGenerator {
  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;

    switch (route) {
      case AppRoutes.onboarding:
        return CupertinoPageRoute(builder: (_) => const OnboardingPage());
      default:
        return errorRoute();
    }
  }

  static Route? errorRoute() =>
      CupertinoPageRoute(builder: (_) => const NotFoundPage());
}
