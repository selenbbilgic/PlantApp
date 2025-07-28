import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/images.dart';
import 'package:plant_app/core/widgets/primary_button.dart';
import 'package:plant_app/routes/app_router.dart';

@RoutePage()
class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ONBOARDING_BACKGROUND, // ← your bg asset
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: topPadding,
            left: 0,
            right: 0,
            child: Image.asset(
              GET_STARTED_IMAGE,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.76,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 12),
                  // Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Welcome to ',
                              style: theme.textTheme.displayLarge?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'PlantApp',
                              style: theme.textTheme.displayLarge,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),

                      const SizedBox(height: 12),

                      // Subtitle
                      Text(
                        'Identify more than 3000+ plants and 88% accuracy.',
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Spacer(),

                  // Get Started Button
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: PrimaryButton(
                          label: 'Get Started',
                          onPressed: () {
                            context.router.push(const OnboardingViewRoute());
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Terms of Use & Privacy Policy
                      Text.rich(
                        TextSpan(
                          text:
                              'By tapping next, you are agreeing to PlantID\n',
                          children: [
                            TextSpan(
                              text: 'Terms of Use',
                              style: theme.textTheme.bodySmall!.copyWith(
                                color: theme.colorScheme.tertiary,
                                decoration: TextDecoration.underline,
                                decorationColor: theme.colorScheme.tertiary,
                                decorationThickness: 1.5,
                              ),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      // TODO: open terms
                                    },
                            ),
                            const TextSpan(text: ' & '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: theme.textTheme.bodySmall!.copyWith(
                                color: theme.colorScheme.tertiary,
                                decoration: TextDecoration.underline,
                                decorationColor: theme.colorScheme.tertiary,
                                decorationThickness: 1.5,
                              ),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      // TODO: open privacy
                                    },
                            ),
                          ],
                        ),
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.tertiary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
