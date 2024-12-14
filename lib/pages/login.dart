import 'package:digipost/components/box_decoration.dart';
import 'package:digipost/components/form/input.dart';
import 'package:digipost/components/notifications.dart';
import 'package:digipost/core/events/user.dart';
import 'package:digipost/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/lntl_localizations.dart';
import 'package:digipost/components/language_switcher.dart'; // Import your LanguageSwitcher
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  LoginPage({super.key, required this.onLocaleChange});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(
            gradientColors: [TailwindColors.gray900, TailwindColors.indigo800],
            beginAlignment: Alignment.topLeft,
            endAlignment: Alignment.bottomRight,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "digipost",
                          style: GoogleFonts.montserrat(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          AppLocalizations.of(context)!.login_top_text,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Email TextField
                        InputBox(
                          controller: emailController,
                          labelText:
                              AppLocalizations.of(context)!.login_top_text,
                          obscureText: false,
                          suffixIcon:
                              const Icon(Icons.email, color: Colors.white),
                          inputStyle: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.empty_field;
                            }
                            // check email format
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return AppLocalizations.of(context)!.invalid_email;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Password TextField
                        InputBox(
                          controller: passwordController,
                          labelText: AppLocalizations.of(context)!.password,
                          obscureText: true,
                          suffixIcon:
                              const Icon(Icons.lock, color: Colors.white),
                          inputStyle: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.empty_field;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Add Forgot Password logic here
                              Navigator.pushNamed(context, '/forgot_password');
                            },
                            child: Text(
                              AppLocalizations.of(context)!.forgot_password,
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: TailwindColors.blue500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Login Button
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              final nexusUserProfile =
                                  context.read<NexusUserProfile>();
                              final String email = emailController.text.trim();
                              final String password =
                                  passwordController.text.trim();

                              if (email.isNotEmpty && password.isNotEmpty) {
                                try {
                                  final res = await nexusUserProfile.login(
                                      email, password);
                                  if (res == 'Success') {
                                    showCustomNotification(
                                      context,
                                      "Login Successful",
                                      NotificationType.success,
                                    );
                                    // Navigator.pushNamed(
                                    //     context, AppRoutes.dashboard);
                                  } else {
                                    showCustomNotification(
                                      context,
                                      "There was an error logging in",
                                      NotificationType.error,
                                    );
                                  }
                                } catch (e) {
                                  showCustomNotification(
                                    context,
                                    Text(e.toString()).data.toString(),
                                    NotificationType.error,
                                  );
                                }
                              } else {
                                showCustomNotification(
                                  context,
                                  "Please fill in all fields",
                                  NotificationType.info,
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: TailwindColors.teal700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Sign Up Prompt
                        Center(
                          child: TextButton(
                            onPressed: () {
                              // Navigate to Sign Up screen
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text(
                              AppLocalizations.of(context)!.register_text,
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: TailwindColors.gray200,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Language Switcher positioned at the top right
          Positioned(
            top: 90,
            right: 24,
            child: LanguageSwitcher(onLocaleChange: onLocaleChange),
          ),
        ],
      ),
    );
  }
}
