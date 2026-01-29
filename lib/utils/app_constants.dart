enum AppState { initial, loading, success, error }

extension AppStateExtension on AppState {
  static const Map<AppState, String> _appStateToString = {
    AppState.initial: 'initial',
    AppState.loading: 'loading',
    AppState.success: 'success',
    AppState.error: 'error',
  };

  static const Map<String, AppState> _stringToAppState = {
    'initial': AppState.initial,
    'loading': AppState.loading,
    'success': AppState.success,
    'error': AppState.error,
  };

  String toMap() {
    return _appStateToString[this]!;
  }
  

  static AppState fromMap(String value) {
    return _stringToAppState[value]!;
  }
}

const String myAppTitle ="akil";
