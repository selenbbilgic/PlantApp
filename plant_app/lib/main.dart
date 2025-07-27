import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/blocs/app_bloc.dart';
import 'package:plant_app/blocs/app_event.dart';
import 'package:plant_app/blocs/app_state.dart';
import 'package:plant_app/core/themes/light_theme.dart';
import 'package:plant_app/presentation/onboarding/get_started_page.dart';
import 'package:plant_app/routes/app_router.dart';
import 'package:plant_app/presentation/bottombar/bottom_nav_bar_view.dart'; // Make sure this import points to where HomeViewRoute is generated or defined

void main() {
  runApp(
    BlocProvider(
      create: (_) => AppBloc()..add(AppStarted()),
      child: PlantApp(),
    ),
  );
}

class PlantApp extends StatelessWidget {
  const PlantApp({Key? key}) : super(key: key);
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listenWhen: (p, c) => p.status != c.status,
      listener: (ctx, state) {
        if (state.status == AppStatus.home) {
          // replace the stack with Home
          ctx.router.replaceAll([const BottomNavBarViewRoute()]);
        } else {
          // if you ever need to go back to onboarding:
          ctx.router.replaceAll([const GetStartedPageRoute()]);
        }
      },
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        theme: lightThemeData,
      ),
    );
  }
}
