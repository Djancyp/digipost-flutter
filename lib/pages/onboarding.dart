import 'package:digipost/components/form/button.dart';
import 'package:digipost/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/lntl_localizations.dart';
import 'package:digipost/components/language_switcher.dart';
import 'package:digipost/components/box_decoration.dart';
import 'package:digipost/core/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const OnboardingPage({super.key, required this.onLocaleChange});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late SharedPreferencesManager _prefs; // SharedPreferencesManager instance
  bool _isOnboardingCompleted = false;

  @override
  void initState() {
    super.initState();
    _initializePreferences();
  }

  // Initialize SharedPreferences and check onboarding status
  Future<void> _initializePreferences() async {
    _prefs = SharedPreferencesManager();
    bool isCompleted = _prefs.getBool("isOnboardingCompleted") ?? false;

    if (isCompleted) {
      // Navigate immediately without updating the UI
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navigateToNextPage();
      });
    } else {
      // Update state only when mounted
      if (mounted) {
        setState(() {
          _isOnboardingCompleted = isCompleted;
        });
      }
    }
  }

  void _navigateToNextPage() {
    Navigator.pushReplacementNamed(context, '/login'); // Change route as needed
  }

  @override
  Widget build(BuildContext context) {
    if (_isOnboardingCompleted) {
      return const SizedBox
          .shrink(); // Prevent rendering if onboarding is already completed
    }

    return Scaffold(
      body: GradientBackground(
        gradientColors: [TailwindColors.gray900, TailwindColors.indigo800],
        beginAlignment: Alignment.topLeft,
        endAlignment: Alignment.bottomRight,
        child: SafeArea(
          child: Column(
            children: [
              // Top section: Language Switcher
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: LanguageSwitcher(onLocaleChange: widget.onLocaleChange),
              ),

              // Center section: Welcome text
              Expanded(
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.welcome,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 24, // Adjusted for better readability
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Bottom section: Next button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(
                  text: AppLocalizations.of(context)!.next,
                  backgroundColor: TailwindColors.teal600,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/onboardinglast');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
