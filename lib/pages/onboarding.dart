import 'package:digipost/components/form/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/lntl_localizations.dart';
import 'package:digipost/components/language_switcher.dart';
import 'package:digipost/components/box_decoration.dart';
import 'package:digipost/core/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  const OnboardingPage({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        gradientColors: [TailwindColors.gray900, TailwindColors.indigo800],
        beginAlignment: Alignment.topLeft,
        endAlignment: Alignment.bottomRight,
        child: SafeArea(
          child: Column(
            children: [
              // Spacer to push content towards the center
              const Spacer(),

              // Centered content
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LanguageSwitcher(onLocaleChange: onLocaleChange),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.welcome,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              // Spacer to push the button to the bottom
              const Spacer(),

              // Button at the bottom
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(
                  text: AppLocalizations.of(context)!.next,
                  backgroundColor: TailwindColors.teal600,
                  onPressed: () {
                    Navigator.pushNamed(context, '/onboardinglast');
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
