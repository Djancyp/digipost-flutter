import 'package:digipost/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/lntl_localizations.dart';

class LanguageSwitcher extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  const LanguageSwitcher({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: TailwindColors.gray900, // Ensure the background is transparent
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        focusColor: Colors.transparent, // Ensure the focus color is transparent
        onTap: () {
          // Open the dropdown on tap (works well on mobile)
        },
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Locale>(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
            value: Localizations.localeOf(context),
            // icon: const Icon(Icons.language, color: Colors.white), // White icon color
            iconSize: 24, // Adjust icon size if necessary
            dropdownColor: TailwindColors.gray900, // Set a modern dropdown color
            style: const TextStyle(color: Colors.white, fontSize: 16), // White text for the selected item
            items: AppLocalizations.supportedLocales.map((locale) {
              return DropdownMenuItem<Locale>(
                value: locale,
                child: Row(
                  children: [
                    Icon(Icons.language, color: Colors.white), // Repeated icon here if needed
                    const SizedBox(width: 8), // Add space between icon and text
                    Text(
                      locale.languageCode.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (Locale? selectedLocale) {
              if (selectedLocale != null) {
                onLocaleChange(selectedLocale);
              }
            },
          ),
        ),
      ),
    );
  }
}
