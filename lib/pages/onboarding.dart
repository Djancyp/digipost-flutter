import 'package:digipost/components/box_decoration.dart';
import 'package:digipost/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/lntl_localizations.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradientBackground(
      // You can pass custom gradient colors and alignments here
      gradientColors: [TailwindColors.gray900, TailwindColors.indigo800],
      beginAlignment: Alignment.topLeft,
      endAlignment: Alignment.bottomRight,
      child: Center(
        child: Text(AppLocalizations.of(context)!.welcome),
      ),
    ));
  }
}
