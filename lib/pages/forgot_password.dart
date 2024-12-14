import 'package:digipost/components/box_decoration.dart';
import 'package:digipost/components/form/input.dart';
import 'package:digipost/components/notifications.dart';
import 'package:digipost/core/events/user.dart';
import 'package:digipost/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/lntl_localizations.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
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
                      "digipost",
                      style: GoogleFonts.montserrat(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context)!.forgot_password,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Email TextField for Forgot Password
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
                    // Reset Password Button
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Navigate to Login screen
                          final nexusUserProfile =
                              context.read<NexusUserProfile>();
                          final email = emailController.text;
                          try {
                            final res =
                                await nexusUserProfile.forgotPassword(email);
                            if (res == "Success") {
                              Navigator.pushNamed(context, '/login');
                              showCustomNotification(
                                context,
                                AppLocalizations.of(context)!
                                    .reset_password_success,
                                NotificationType.success,
                              );
                            }
                          } catch (e) {
                            showCustomNotification(
                              context,
                              AppLocalizations.of(context)!.login_error,
                              NotificationType.error,
                            );
                          }
                        }

                        // Add reset password logic here
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
                        AppLocalizations.of(context)!.reset_password,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Back to Login Button
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigate to Login screen
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login_text,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: TailwindColors.white,
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
