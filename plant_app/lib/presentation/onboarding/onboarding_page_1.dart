import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/images.dart';
import 'package:plant_app/core/widgets/primary_button.dart';
import 'package:plant_app/routes/app_router.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),

              // Title
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Take a photo to ',
                      style: theme.textTheme.displayLarge?.copyWith(
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      text: 'identify',
                      style: theme.textTheme.displayLarge?.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: '\nthe plant!',
                      style: theme.textTheme.displayLarge?.copyWith(
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Centered Onboarding Image
              Expanded(
                child: Image.asset(
                  ONBOARDING_1_IMAGE,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 32),

              // Continue Button
              PrimaryButton(
                label: 'Continue',
                onPressed: () {
                  // Navigate to next onboarding page
                },
              ),

              const SizedBox(height: 16),

              // Page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(isActive: true),
                  const SizedBox(width: 8),
                  _buildDot(isActive: false),
                  const SizedBox(width: 8),
                  _buildDot(isActive: false),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot({required bool isActive}) {
    return Container(
      width: isActive ? 10 : 8,
      height: isActive ? 10 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.black87 : Colors.grey[400],
      ),
    );
  }
}
