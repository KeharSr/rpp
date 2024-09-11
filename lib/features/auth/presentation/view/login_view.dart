import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rpp/core/common/text_form_field.dart';
import 'package:rpp/features/auth/presentation/widgets/facebook_custom_widget.dart';
import 'package:rpp/features/auth/presentation/widgets/google_custom_widget.dart';
import 'package:rpp/features/auth/presentation/widgets/login_animations.dart';
import 'package:rpp/features/language/easy_localization_delegate.dart';
import 'package:rpp/features/language/easy_localization_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

/// Component Widget this layout UI
class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  //Animation Declaration
  late AnimationController sanimationController;

  var tap = 0;

  @override

  /// set state animation controller
  void initState() {
    sanimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addStatusListener((statuss) {
        if (statuss == AnimationStatus.dismissed) {
          setState(() {
            tap = 0;
          });
        }
      });
    // TODO: implement initState
    super.initState();
  }

  /// Dispose animation controller
  @override
  void dispose() {
    sanimationController.dispose();
    super.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> _PlayAnimation() async {
    try {
      await sanimationController.forward();
      await sanimationController.reverse();
    } on TickerCanceled {}
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.width;
    mediaQueryData.size.height;

    var data = EasyLocalizationProvider.of(context)!.data;

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          /// Set Background image in layout (Click to open code)
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/img/LoginScreenbackground.png"),
            fit: BoxFit.cover,
          )),
          child: Container(
            /// Set gradient color in image (Click to open code)
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.0),
                  Color.fromRGBO(0, 0, 0, 0.3)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),

            /// Set component layout
            child: ListView(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          alignment: AlignmentDirectional.topCenter,
                          child: Column(
                            children: <Widget>[
                              /// padding logo
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: mediaQueryData.padding.top + 40.0)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Image(
                                    image: AssetImage("assets/img/Logo.png"),
                                    height: 70.0,
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0)),

                                  /// Animation text treva shop accept from signup layout (Click to open code)
                                  Hero(
                                    tag: "Treva",
                                    child: Text(
                                      AppLocalizations.of(context)!.tr('title'),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.6,
                                          color: Colors.white,
                                          fontFamily: "Sans",
                                          fontSize: 20.0),
                                    ),
                                  ),
                                ],
                              ),

                              /// ButtonCustomFacebook
                              const Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 30.0)),
                              const ButtonCustomFacebook(),

                              /// ButtonCustomGoogle
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7.0)),
                              const ButtonCustomGoogle(),

                              /// Set Text
                              const Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 10.0)),
                              Text(
                                AppLocalizations.of(context)!.tr('or'),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: 0.2,
                                    fontFamily: 'Sans',
                                    fontSize: 17.0),
                              ),

                              /// TextFromField Email
                              const Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 10.0)),
                              TextFromField(
                                icon: Icons.email,
                                password: false,
                                email:
                                    AppLocalizations.of(context)!.tr('email'),
                                inputType: TextInputType.emailAddress,
                              ),

                              /// TextFromField Password
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0)),
                              TextFromField(
                                icon: Icons.vpn_key,
                                password: true,
                                email: AppLocalizations.of(context)!
                                    .tr('password'),
                                inputType: TextInputType.text,
                              ),

                              /// Button Signup
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: InkWell(
                                    onTap: () {
                                      // Navigator.of(context).pushReplacement(
                                      //     MaterialPageRoute(
                                      //         builder: (BuildContext context) =>
                                      //             Signup()));
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .tr('notHave'),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Sans"),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: mediaQueryData.padding.top + 100.0,
                                    bottom: 0.0),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                    /// Set Animaion after user click buttonLogin
                    tap == 0
                        ? InkWell(
                            splashColor: Colors.yellow,
                            onTap: () {
                              setState(() {
                                tap = 1;
                              });
                              LoginAnimation(
                                animationController: sanimationController.view
                                    as AnimationController,
                              );
                              _PlayAnimation();
                            },
                            child: const buttonBlackBottom(),
                          )
                        : LoginAnimation(
                            animationController: sanimationController.view
                                as AnimationController,
                          )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///ButtonBlack class
class buttonBlackBottom extends StatelessWidget {
  const buttonBlackBottom({super.key});

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
          AppLocalizations.of(context)!.tr('login'),
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
