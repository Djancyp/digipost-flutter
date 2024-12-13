import 'package:digipost/core/routes/app_routes.dart';
import 'package:digipost/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/lntl_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digipost',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: RouteGenerator.onGenerate,
      initialRoute: AppRoutes.onboarding,
    );
  }
}
