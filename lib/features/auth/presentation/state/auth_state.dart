class AuthState {
  final bool isLoading;
  final String? error;
  final bool isLoginSuccess;
  final bool isRegisterSuccess;

  AuthState(
      {required this.isLoading,
      required this.error,
      required this.isLoginSuccess,
      required this.isRegisterSuccess});

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
      isLoginSuccess: false,
      isRegisterSuccess: false,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    bool? isLoginSuccess,
    bool? isRegisterSuccess,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
      isRegisterSuccess: isRegisterSuccess ?? this.isRegisterSuccess,
    );
  }
}
