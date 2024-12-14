import 'package:digipost/core/events/user.dart';
import 'package:digipost/core/routes/app_routes.dart';
import 'package:digipost/core/themes/theme.dart';
import 'package:digipost/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/lntl_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager().init();
  runApp(MultiProvider(providers: [
    //ChangeNotifierProvider(create: (context) => NexusLoginEvent()),
    ChangeNotifierProvider(
      create: (context) => NexusUserProfile(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  // Function to load the saved locale from SharedPreferences
  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('languageCode') ??
        'en'; // Default to 'en' if no value is saved
    final countryCode = prefs.getString('countryCode') ??
        ''; // Default to '' for no country code
    setState(() {
      _locale = Locale(languageCode, countryCode);
    });
  }

  // Function to save the selected locale to SharedPreferences
  void _changeLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
    await prefs.setString('countryCode', locale.countryCode ?? '');
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadLocale(); // Load the saved locale when the app starts
    RouteGenerator.onLocaleChange =
        _changeLocale; // Ensure onLocaleChange is set properly
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digipost',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: RouteGenerator.onGenerate,
      initialRoute: AppRoutes.onboarding,
    );
  }
}
