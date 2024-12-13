import 'package:digipost/components/form/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/lntl_localizations.dart';
import 'package:digipost/components/box_decoration.dart';
import 'package:digipost/core/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingLastPage extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const OnboardingLastPage({super.key, required this.onLocaleChange});

  @override
  State<OnboardingLastPage> createState() => _OnboardingLastPageState();
}

class _OnboardingLastPageState extends State<OnboardingLastPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch localized text slides inside the build method
    final List<String> textSlides = [
      AppLocalizations.of(context)!.onboarding_last_slide_1,
      AppLocalizations.of(context)!.onboarding_last_slide_2,
      AppLocalizations.of(context)!.onboarding_last_slide_3,
    ];

    return Scaffold(
      body: GradientBackground(
        gradientColors: [TailwindColors.gray900, TailwindColors.indigo800],
        beginAlignment: Alignment.topLeft,
        endAlignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: textSlides.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Center(
                      child: Text(
                        textSlides[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                textSlides.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: _currentIndex == index ? 12.0 : 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? TailwindColors.teal600
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: AppLocalizations.of(context)!.next,
              backgroundColor: TailwindColors.teal600,
              onPressed: () {
                if (_currentIndex < textSlides.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushNamed(context, '/next_text');
                }
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: AppLocalizations.of(context)!.skip,
              backgroundColor: TailwindColors.black,
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
