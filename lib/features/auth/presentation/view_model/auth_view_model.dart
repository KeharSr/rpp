import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/core/common/my_snackbar.dart';
import 'package:rpp/features/auth/domain/usecase/auth_usecase.dart';
import 'package:rpp/features/auth/presentation/state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(ref.read(authUsecaseProvider)),
);

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.authUsecase) : super(AuthState.initial());

  final AuthUsecase authUsecase;

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true);

    final result = await authUsecase.login(email: email, password: password);

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showMySnackBar(message: failure.error);
      },
      (success) =>
          state = state.copyWith(isLoading: false, isLoginSuccess: true),
    );
  }
}
