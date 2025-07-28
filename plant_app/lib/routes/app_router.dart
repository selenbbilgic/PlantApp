import 'package:auto_route/auto_route.dart';
import 'package:plant_app/presentation/bottombar/bottom_nav_bar_view.dart';
import 'package:plant_app/presentation/onboarding/get_started_page.dart';
import 'package:plant_app/presentation/onboarding/onboarding_page_1.dart';
import 'package:plant_app/presentation/onboarding/onboarding_page_2.dart';
import 'package:plant_app/presentation/onboarding/onboarding_view.dart';
import 'package:plant_app/presentation/paywall/paywall_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route|View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: BottomNavBarViewRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),
    AutoRoute(page: GetStartedPageRoute.page, initial: true),
    CustomRoute(
      page: OnboardingViewRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 200,
    ),
    //AutoRoute(page: BottomNavBarViewRoute.page),
    CustomRoute(
      page: PaywallViewRoute.page,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 300,
    ),
  ];
}


// flutter pub run build_runner clean
// dart run build_runner build --delete-conflicting-outputs