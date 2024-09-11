import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EasyLocalizationProvider extends InheritedWidget {
  const EasyLocalizationProvider({super.key, required this.child, this.data})
      : super(child: child);
  final _EasyLocalizationState? data;
  @override
  final Widget child;

  static EasyLocalizationProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<EasyLocalizationProvider>();
  }

  @override
  bool updateShouldNotify(EasyLocalizationProvider oldWidget) {
    return true;
  }
}

class EasyLocalization extends StatefulWidget {
  final Widget? child;
  const EasyLocalization({super.key, this.child});
  @override
  _EasyLocalizationState createState() => _EasyLocalizationState();
}

class _EasyLocalizationState extends State<EasyLocalization> {
  Locale? _locale;
  Locale? _savedLocale;

  Locale? get locale => _locale;
  Locale? get savedLocale => _savedLocale;
  @override
  void initState() {
    super.initState();
    saveLocale();
  }

  void changeLocale(Locale value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('codeC', value.countryCode!);
    await preferences.setString('codeL', value.languageCode);
    var codeLang = preferences.getString('codeL');
    var codeCoun = preferences.getString('codeC');
    setState(() {
      _locale = Locale(codeLang!, codeCoun);
      _savedLocale = Locale(codeLang, codeCoun);
    });
  }

  void saveLocale() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var codeLang = preferences.getString('codeL');
    var codeCoun = preferences.getString('codeC');
    if (codeLang != null || codeCoun != null) {
      setState(() {
        _savedLocale = const Locale('en', 'US');
        //  _savedLocale = Locale(_codeLang, _codeCoun);
      });
    }
  }

  @override
  Widget build(BuildContext context) => EasyLocalizationProvider(
        data: this,
        child: widget.child!,
      );
}
