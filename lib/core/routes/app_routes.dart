import 'package:digipost/pages/dashboard.dart';
import 'package:digipost/pages/forgot_password.dart';
import 'package:digipost/pages/login.dart';
import 'package:digipost/pages/not_found.dart';
import 'package:digipost/pages/onboadpagelast.dart';
import 'package:digipost/pages/onboarding.dart';
import 'package:digipost/pages/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:digipost/store/store.dart';

class AppRoutes {
  /// The Initial Page
  static const onboarding = '/onboarding';
  static const onboarding1 = '/onboardinglast';
  static const login = '/login';
  static const signup = '/signup';
  static const forgotPassword = '/forgot_password';

	static const dashboard = '/dashboard';
}

class RouteGenerator {
  static Function(Locale)? onLocaleChange;

  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;

    // Dynamically handle onboarding status for the initial route
    if (route == '/onboarding' || route == '/') {
      return _handleInitialRoute();
    }

    // Handle specific routes
    switch (route) {
      case AppRoutes.onboarding:
        if (onLocaleChange == null) {
          throw Exception("onLocaleChange callback is not initialized.");
        }
        return CupertinoPageRoute(
          builder: (_) => OnboardingPage(
            onLocaleChange: onLocaleChange!,
          ),
        );
      case AppRoutes.onboarding1:
        if (onLocaleChange == null) {
          throw Exception("onLocaleChange callback is not initialized.");
        }
        return CupertinoPageRoute(
          builder: (_) => OnboardingLastPage(
            onLocaleChange: onLocaleChange!,
          ),
        );
      case AppRoutes.login:
        if (onLocaleChange == null) {
          throw Exception("onLocaleChange callback is not initialized.");
        }
        return CupertinoPageRoute(
          builder: (_) => LoginPage(
            onLocaleChange: onLocaleChange!,
          ),
        );
      case AppRoutes.signup:
        return CupertinoPageRoute(builder: (_) => const SignUpPage());
      case AppRoutes.forgotPassword:
        return CupertinoPageRoute(builder: (_) => const ForgotPasswordPage());
			case AppRoutes.dashboard:
				return CupertinoPageRoute(builder: (_) => const DashboardPage());

      default:
        return errorRoute();
    }
  }

  /// Initial route handler: Determines if onboarding is complete
  static Route _handleInitialRoute() {
    SharedPreferencesManager prefs = SharedPreferencesManager();
		// prefs.remove("isOnboardingCompleted"); // debug purpose
    bool isOnboardingCompleted =
        prefs.getBool("isOnboardingCompleted") ?? false;

    if (isOnboardingCompleted) {
      // Redirect to login page if onboarding is complete
      return CupertinoPageRoute(
        builder: (_) => LoginPage(
          onLocaleChange: onLocaleChange!,
        ),
      );
    } else {
      // Redirect to onboarding page if not completed
      return CupertinoPageRoute(
        builder: (_) => OnboardingPage(
          onLocaleChange: onLocaleChange!,
        ),
      );
    }
  }

  static Route? errorRoute() =>
      CupertinoPageRoute(builder: (_) => const NotFoundPage());
}
