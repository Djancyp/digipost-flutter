import 'package:digipost/components/box_decoration.dart';
import 'package:digipost/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/lntl_localizations.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email, color: Colors.white),
                      labelText: AppLocalizations.of(context)!.email,
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  // Reset Password Button
                  ElevatedButton(
                    onPressed: () {
                      // Add reset password logic here
                      Navigator.pushNamed(context, '/reset_password');
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
    );
  }
}
