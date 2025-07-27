import 'package:auto_route/auto_route.dart';
import 'package:plant_app/presentation/bottombar/bottom_nav_bar_view.dart';
import 'package:plant_app/presentation/onboarding/get_started_page.dart';
import 'package:plant_app/presentation/onboarding/onboarding_page_1.dart';
import 'package:plant_app/presentation/onboarding/onboarding_page_2.dart';
import 'package:plant_app/presentation/onboarding/onboarding_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route|View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: GetStartedPageRoute.page, initial: true),
    AutoRoute(page: OnboardingViewRoute.page),
    AutoRoute(page: BottomNavBarViewRoute.page),
  ];
}
