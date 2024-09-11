import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalizations {
  AppLocalizations(
    this.locale, {
    this.path,
    this.loadPath,
    this.useOnlyLangCode = false,
  });

  Locale locale;
  final String? path;
  final String? loadPath;

  /// use only the lang code to generate i18n file path like en.json or ar.json
  final bool useOnlyLangCode;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, dynamic>? _sentences;

  Future<bool> load() async {
    late String data;

    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var codeLang = preferences.getString('codeL')!;
    var codeCoun = preferences.getString('codeC');

    locale = Locale(codeLang, codeCoun);

    var basePath = path ?? loadPath;
    var localePath = '$basePath/$codeLang';
    localePath += useOnlyLangCode ? '.json' : '-$codeCoun.json';

    if (path != null) {
      data = await rootBundle.loadString(localePath);
    } else if (loadPath != null) {
      data = await http
          .get(Uri.https(localePath, localePath))
          .then((response) => response.body.toString());
    }

    Map<String, dynamic> result = json.decode(data);

    // ignore: unnecessary_this, prefer_collection_literals, unnecessary_new
    this._sentences = new Map();
    result.forEach((String key, dynamic value) {
      _sentences![key] = value;
    });

    return true;
  }

  String tr(String key, {List<String>? args}) {
    String res = _resolve(key, _sentences);
    if (args != null) {
      for (var str in args) {
        res = res.replaceFirst(RegExp(r'{}'), str);
      }
    }
    return res;
  }

  String plural(String key, dynamic value) {
    String? res = '';
    if (value == 0) {
      res = _sentences![key]['zero'];
    } else if (value == 1) {
      res = _sentences![key]['one'];
    } else {
      res = _sentences![key]['other'];
    }
    return res!.replaceFirst(RegExp(r'{}'), '$value');
  }

  String _resolve(String path, dynamic obj) {
    List<String> keys = path.split('.');

    if (keys.length > 1) {
      for (int index = 0; index <= keys.length; index++) {
        if (obj.containsKey(keys[index]) && obj[keys[index]] is! String) {
          return _resolve(
              keys.sublist(index + 1, keys.length).join('.'), obj[keys[index]]);
        }

        return obj[path] ?? path;
      }
    }

    return obj[path] ?? path;
  }
}

class EasylocaLizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  final Locale? locale;
  final String? path;
  final String? loadPath;

  ///  * use only the lang code to generate i18n file path like en.json or ar.json
  final bool useOnlyLangCode;

  EasylocaLizationDelegate({
    required this.locale,
    this.path,
    this.loadPath,
    this.useOnlyLangCode = false,
  });

  @override
  bool isSupported(Locale locale) => locale != null;

  @override
  Future<AppLocalizations> load(Locale value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var codeLang = preferences.getString('codeL');
    var codeCoun = preferences.getString('codeC');
    if (codeLang == null || codeCoun == null) {
      //value = Locale(this.locale.languageCode, this.locale.countryCode);
      await preferences.setString('codeC', value.countryCode!);
      await preferences.setString('codeL', value.languageCode);
    } else {
      value = Locale(codeLang, codeCoun);
    }
    AppLocalizations localizations = AppLocalizations(value,
        path: path, loadPath: loadPath, useOnlyLangCode: useOnlyLangCode);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}
