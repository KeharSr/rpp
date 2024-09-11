class AuthState {
  final bool isLoading;
  final String? error;
  final bool isLoginSuccess;

  AuthState(
      {required this.isLoading,
      required this.error,
      required this.isLoginSuccess});

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
      isLoginSuccess: false,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    bool? isLoginSuccess,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }
}
