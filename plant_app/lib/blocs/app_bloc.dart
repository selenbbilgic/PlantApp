import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/blocs/app_event.dart';
import 'package:plant_app/blocs/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<AppStarted>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final seenOnboarding = prefs.getBool('onboarding_done') ?? false;
      emit(
        AppState(
          status: seenOnboarding ? AppStatus.home : AppStatus.onboarding,
        ),
      );
    });

    on<OnboardingCompleted>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding_done', true);
      emit(const AppState(status: AppStatus.home));
    });
  }
}
