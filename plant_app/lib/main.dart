import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/blocs/app_bloc.dart';
import 'package:plant_app/blocs/app_event.dart';
import 'package:plant_app/blocs/app_state.dart';
import 'package:plant_app/core/themes/light_theme.dart';
import 'package:plant_app/presentation/onboarding/get_started_page.dart';
import 'package:plant_app/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (_) => AppBloc()..add(AppStarted()),
      child: const PlantApp(),
    ),
  );
}

class PlantApp extends StatelessWidget {
  const PlantApp({Key? key}) : super(key: key);
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: lightThemeData,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return BlocListener<AppBloc, AppState>(
          listenWhen: (prev, curr) => prev.status != curr.status,
          listener: (_, state) {
            if (state.status == AppStatus.home) {
              _appRouter.replaceAll([const BottomNavBarViewRoute()]);
            } else {
              _appRouter.replaceAll([const GetStartedPageRoute()]);
            }
          },
          child: child!,
        );
      },
    );
  }
}
