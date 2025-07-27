import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<_OnboardingContent> _pages = const [
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
    _OnboardingContent(
      titleStart: 'Get ',
      titleHighlight: 'care tips',
      titleEnd: ' tailored for you!',
      image: GET_STARTED_IMAGE,
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.router.push(const BottomNavBarViewRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    final item = _pages[index];
                    return Column(
                      children: [
                        const SizedBox(height: 24),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: item.titleStart,
                                style: theme.textTheme.displayLarge?.copyWith(
                                  fontSize: 26,
                                ),
                              ),
                              TextSpan(
                                text: item.titleHighlight,
                                style: theme.textTheme.displayLarge?.copyWith(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              TextSpan(
                                text: item.titleEnd,
                                style: theme.textTheme.displayLarge?.copyWith(
                                  fontSize: 26,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        Expanded(
                          child: Image.asset(
                            item.image,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              PrimaryButton(
                label:
                    _currentPage == _pages.length - 1
                        ? 'Get Started'
                        : 'Continue',
                onPressed: _nextPage,
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => _buildDot(index == _currentPage),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 10 : 8,
      height: isActive ? 10 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black87 : Colors.grey[400],
        shape: BoxShape.circle,
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
