import 'package:flutter/material.dart';
import 'package:rpp/features/language/easy_localization_delegate.dart';

class ButtonBlackBottom extends StatelessWidget {
  const ButtonBlackBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 55.0,
        width: 600.0,
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.black38, blurRadius: 15.0)
            ],
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
                colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])),
        child: Text(
          AppLocalizations.of(context)!.tr('signUp'),
          style: const TextStyle(
              color: Colors.white,
              letterSpacing: 0.2,
              fontFamily: "Sans",
              fontSize: 18.0,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
