import 'package:flutter/material.dart';
import 'package:rpp/features/language/easy_localization_delegate.dart';
import 'package:rpp/features/language/easy_localization_provider.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int currentIndex = 0;

  /// Set a type current number a layout class

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context)!.data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        body: const Center(
          child: Text('Hello World'),
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
                textTheme: Theme.of(context).textTheme.copyWith(
                    bodySmall: const TextStyle(color: Colors.black12))),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              fixedColor: const Color(0xFF6991C7),
              unselectedItemColor: Colors.black12,
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.home,
                      size: 23.0,
                    ),
                    label: AppLocalizations.of(context)!.tr('home')),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.shop),
                    label: AppLocalizations.of(context)!.tr('brand')),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.shopping_cart),
                    label: AppLocalizations.of(context)!.tr('cart')),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.person,
                      size: 24.0,
                    ),
                    label: AppLocalizations.of(context)!.tr('account')),
              ],
            )),
      ),
    );
  }
}
