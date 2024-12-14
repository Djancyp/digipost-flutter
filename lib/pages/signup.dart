import 'package:digipost/components/box_decoration.dart';
import 'package:digipost/components/form/input.dart';
import 'package:digipost/components/notifications.dart';
import 'package:digipost/core/events/user.dart';
import 'package:digipost/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/lntl_localizations.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
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
                      AppLocalizations.of(context)!.register_top_text,
                      style: GoogleFonts.montserrat(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context)!.register_middle_text,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Email TextField
                    InputBox(
                      controller: emailController,
                      labelText: AppLocalizations.of(context)!.login_top_text,
                      obscureText: false,
                      suffixIcon: const Icon(Icons.email, color: Colors.white),
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
                      suffixIcon: const Icon(Icons.lock, color: Colors.white),
                      inputStyle: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.empty_field;
                        }
                        // check pasword length is greater than 8
                        if (value.length < 8) {
                          return AppLocalizations.of(context)!
                              .password_length_error;
                        }

                        // check password contains at least one number and one special character
                        if (!RegExp(r'^(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})')
                            .hasMatch(value)) {
                          return AppLocalizations.of(context)!
                              .password_complexity_error;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () async {
                        // Add sign-up logic here
                        if (_formKey.currentState?.validate() ?? false) {
                          final email = emailController.text;
                          final password = passwordController.text;
                          try {
                            final nexusUserProfile =
                                context.read<NexusUserProfile>();
                            final res = await nexusUserProfile.createContact(
                                email, password);
                            if (res == "Success") {
                              showCustomNotification(
                                context,
                                AppLocalizations.of(context)!.register_success,
                                NotificationType.success,
                              );
                              Navigator.pushNamed(context, '/login');
                            }
                          } catch (e) {
                            showCustomNotification(
                              context,
                              AppLocalizations.of(context)!.register_error,
                              NotificationType.error,
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
                        AppLocalizations.of(context)!.register_button,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Sign In Prompt
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigate to Login screen
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          AppLocalizations.of(context)!.already_have_account,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.white70,
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
    );
  }
}
