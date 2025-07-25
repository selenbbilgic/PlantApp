import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/images.dart';
import 'package:plant_app/core/widgets/primary_button.dart';
import 'package:plant_app/routes/app_routing.dart';

@RoutePage()
class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome to ',
                      style: theme.textTheme.displayLarge,
                    ),
                    TextSpan(
                      text: 'PlantApp',
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              // Subtitle
              Text(
                'Identify more than 3000+ plants and 88% accuracy.',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      GET_STARTED_IMAGE,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Get Started Button
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  label: 'Get Started',
                  onPressed: () {
                    context.router.push(const OnboardingRoute1());
                  },
                ),
              ),

              const SizedBox(height: 12),

              // Terms of Use & Privacy Policy
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
                  children: [
                    const TextSpan(
                      text: 'By tapping next, you are agreeing to PlantID\n',
                    ),
                    TextSpan(
                      text: 'Terms of Use',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              // TODO: Open terms page
                            },
                    ),
                    const TextSpan(text: ' & '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              // TODO: Open privacy policy
                            },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
