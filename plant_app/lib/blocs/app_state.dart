enum AppStatus { onboarding, home }

class AppState {
  final AppStatus status;

  const AppState({required this.status});

  factory AppState.initial() => const AppState(status: AppStatus.onboarding);
}
