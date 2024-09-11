import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rpp/app/navigator_key/navigator_key.dart';
import 'package:rpp/features/auth/presentation/view/login_view.dart';
import 'package:rpp/features/language/easy_localization_delegate.dart';
import 'package:rpp/features/language/easy_localization_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context)!.data!;

    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        title: "RPP",
        theme: ThemeData(
            buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
            brightness: Brightness.light,
            primaryColorLight: Colors.white,
            primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        navigatorKey: AppNavigator.navigatorKey,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasylocaLizationDelegate(
            locale: data.locale,
            path: 'assets/language',
          )
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('zh', 'HK'),
          Locale('ar', 'DZ'),
          Locale('hi', 'IN'),
          Locale('id', 'ID')
        ],
        locale: data.savedLocale,
      ),
    );
  }
}
