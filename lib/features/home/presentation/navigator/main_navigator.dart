
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/app/navigator/navigator.dart';
import 'package:rpp/features/auth/presentation/navigator/auth_navigator.dart';
import 'package:rpp/features/home/presentation/view/main_view.dart';

final mainViewNavigatorProvider = Provider<MainViewNavigator>((ref) {
  return MainViewNavigator();
});

class MainViewNavigator with LoginViewRoute {}

mixin HomeViewRoute {
  openHomeView() {
    NavigateRoute.popAndPushRoute(const MainView());
  }

  
}
