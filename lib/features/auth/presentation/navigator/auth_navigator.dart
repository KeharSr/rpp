import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/app/navigator/navigator.dart';
import 'package:rpp/features/auth/presentation/view/login_view.dart';
import 'package:rpp/features/home/presentation/navigator/main_navigator.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with HomeViewRoute, LoginViewRoute {}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.popAndPushRoute(const LoginView());
  }
}
