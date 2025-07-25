import 'package:auto_route/auto_route.dart';
import 'package:plant_app/presentation/onboarding/get_started_page.dart';
import 'package:plant_app/presentation/onboarding/onboarding_page_1.dart';
import 'package:plant_app/presentation/onboarding/onboarding_page_2.dart';

part 'app_routing.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: GetStartedRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute1.page),
    AutoRoute(page: OnboardingRoute2.page),
  ];
}
