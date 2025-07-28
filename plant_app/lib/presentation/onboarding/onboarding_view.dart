import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/blocs/app_bloc.dart';
import 'package:plant_app/blocs/app_event.dart';
import 'package:plant_app/core/constants/images.dart';
import 'package:plant_app/core/widgets/primary_button.dart';
import 'package:plant_app/presentation/bottombar/bottom_nav_bar_view.dart';
import 'package:plant_app/routes/app_router.dart';

@RoutePage()
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _controller = PageController();
  int _currentPage = 0;

  final _pages = const [
    _OnboardingContent(
      titleStart: 'Take a photo to ',
      titleHighlight: 'identify',
      titleEnd: '\nthe plant!',
      image: ONBOARDING_1_IMAGE,
    ),
    _OnboardingContent(
      titleStart: 'Discover ',
      titleHighlight: 'plant details',
      titleEnd: ' instantly!',
      image: ONBOARDING_2_IMAGE,
    ),
  ];

  void _next() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.router.push(const PaywallViewRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topPad = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // 1) background (behind status bar)
          Positioned.fill(
            child: Image.asset(ONBOARDING_BACKGROUND, fit: BoxFit.cover),
          ),

          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 12),
                // 2) the swipable “above‐the‐button” area
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (i) => setState(() => _currentPage = i),
                    itemCount: _pages.length,
                    itemBuilder: (_, i) {
                      final p = _pages[i];
                      return Stack(
                        children: [
                          // full‐width hero image
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Image.asset(
                              p.image,
                              fit: BoxFit.contain,
                              height: MediaQuery.of(context).size.height * .8,
                            ),
                          ),
                          // title text
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: p.titleStart,
                                    style: theme.textTheme.displayLarge
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  TextSpan(
                                    text: p.titleHighlight,
                                    style: theme.textTheme.displayLarge
                                        ?.copyWith(fontWeight: FontWeight.w800),
                                  ),
                                  TextSpan(
                                    text: p.titleEnd,
                                    style: theme.textTheme.displayLarge
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      PrimaryButton(label: 'Continue', onPressed: _next),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pages.length + 1,
                          (i) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: i == _currentPage ? 10 : 8,
                            height: i == _currentPage ? 10 : 8,
                            decoration: BoxDecoration(
                              color:
                                  i == _currentPage
                                      ? Theme.of(
                                        context,
                                      ).colorScheme.inverseSurface
                                      : Theme.of(context).colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingContent {
  final String titleStart;
  final String titleHighlight;
  final String titleEnd;
  final String image;

  const _OnboardingContent({
    required this.titleStart,
    required this.titleHighlight,
    required this.titleEnd,
    required this.image,
  });
}
