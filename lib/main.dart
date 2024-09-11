import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/app/app.dart';
import 'package:rpp/features/language/easy_localization_provider.dart';

void main() {
  runApp(
    const ProviderScope(child: EasyLocalization(child: App())),
  );
}
