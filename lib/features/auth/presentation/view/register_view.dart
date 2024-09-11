// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:rpp/core/common/buttom_black_buttom.dart';
// import 'package:rpp/core/common/text_form_field.dart';
// import 'package:rpp/features/auth/presentation/view/login_view.dart';
// import 'package:rpp/features/auth/presentation/widgets/login_animations.dart';
// import 'package:rpp/features/language/easy_localization_delegate.dart';
// import 'package:rpp/features/language/easy_localization_provider.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> with TickerProviderStateMixin {
//   //Animation Declaration
//   late AnimationController sanimationController;
//   AnimationController? animationControllerScreen;
//   Animation? animationScreen;
//   var tap = 0;

//   /// Set AnimationController to initState
//   @override
//   void initState() {
//     sanimationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 800))
//       ..addStatusListener((statuss) {
//         if (statuss == AnimationStatus.dismissed) {
//           setState(() {
//             tap = 0;
//           });
//         }
//       });
//     // TODO: implement initState
//     super.initState();
//   }

//   /// Dispose animationController
//   @override
//   void dispose() {
//     sanimationController.dispose();
//     super.dispose();
//   }

//   /// Playanimation set forward reverse
//   Future<Null> _PlayAnimation() async {
//     try {
//       await sanimationController.forward();
//       await sanimationController.reverse();
//     } on TickerCanceled {}
//   }

//   /// Component Widget layout UI
//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData mediaQueryData = MediaQuery.of(context);
//     mediaQueryData.devicePixelRatio;
//     mediaQueryData.size.height;
//     mediaQueryData.size.width;

//     var data = EasyLocalizationProvider.of(context)!.data;
//     return EasyLocalizationProvider(
//       data: data,
//       child: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             Container(
//               /// Set Background image in layout
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                 image: AssetImage("assets/img/backgroundgirl.png"),
//                 fit: BoxFit.cover,
//               )),
//               child: Container(
//                 /// Set gradient color in image
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromRGBO(0, 0, 0, 0.2),
//                       Color.fromRGBO(0, 0, 0, 0.3)
//                     ],
//                     begin: FractionalOffset.topCenter,
//                     end: FractionalOffset.bottomCenter,
//                   ),
//                 ),

//                 /// Set component layout
//                 child: ListView(
//                   padding: const EdgeInsets.all(0.0),
//                   children: <Widget>[
//                     Stack(
//                       alignment: AlignmentDirectional.bottomCenter,
//                       children: <Widget>[
//                         Column(
//                           children: <Widget>[
//                             Container(
//                               alignment: AlignmentDirectional.topCenter,
//                               child: Column(
//                                 children: <Widget>[
//                                   /// padding logo
//                                   Padding(
//                                       padding: EdgeInsets.only(
//                                           top: mediaQueryData.padding.top +
//                                               40.0)),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: <Widget>[
//                                       const Image(
//                                         image:
//                                             AssetImage("assets/img/Logo.png"),
//                                         height: 70.0,
//                                       ),
//                                       const Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10.0)),

//                                       /// Animation text treva shop accept from login layout
//                                       Hero(
//                                         tag: "Treva",
//                                         child: Text(
//                                           AppLocalizations.of(context)!
//                                               .tr('title'),
//                                           style: const TextStyle(
//                                               fontWeight: FontWeight.w900,
//                                               letterSpacing: 0.6,
//                                               fontFamily: "Sans",
//                                               color: Colors.white,
//                                               fontSize: 20.0),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 70.0)),

//                                   /// TextFromField Email
//                                   TextFromField(
//                                     icon: Icons.email,
//                                     password: false,
//                                     email: AppLocalizations.of(context)!
//                                         .tr('firstName'),
//                                     inputType: TextInputType.emailAddress,
//                                   ),
//                                   const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 5.0)),

//                                   TextFromField(
//                                     icon: Icons.email,
//                                     password: false,
//                                     email: AppLocalizations.of(context)!
//                                         .tr('lastName'),
//                                     inputType: TextInputType.emailAddress,
//                                   ),
//                                   const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 5.0)),

//                                   TextFromField(
//                                     icon: Icons.email,
//                                     password: false,
//                                     email: AppLocalizations.of(context)!
//                                         .tr('email'),
//                                     inputType: TextInputType.emailAddress,
//                                   ),
//                                   const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 5.0)),

//                                   TextFromField(
//                                     icon: Icons.email,
//                                     password: false,
//                                     email: AppLocalizations.of(context)!
//                                         .tr('phone'),
//                                     inputType: TextInputType.emailAddress,
//                                   ),
//                                   const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 5.0)),

//                                   /// TextFromField Password
//                                   TextFromField(
//                                     icon: Icons.vpn_key,
//                                     password: true,
//                                     email: AppLocalizations.of(context)!
//                                         .tr('password'),
//                                     inputType: TextInputType.text,
//                                   ),

//                                   // check box for terms and conditions
//                                   Row(
//                                     children: <Widget>[
//                                       Checkbox(
//                                         value: false,
//                                         onChanged: (bool? value) {},
//                                       ),
//                                       Text(
//                                         AppLocalizations.of(context)!
//                                             .tr('termsAndConditions'),
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 13.0,
//                                             fontWeight: FontWeight.w600,
//                                             fontFamily: "Sans"),
//                                       ),
//                                     ],
//                                   ),

//                                   /// Button Login
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 20.0),
//                                     child: InkWell(
//                                         onTap: () {
//                                           Navigator.of(context).pushReplacement(
//                                               MaterialPageRoute(
//                                                   builder:
//                                                       (BuildContext context) =>
//                                                           const LoginScreen()));
//                                         },
//                                         child: Text(
//                                           AppLocalizations.of(context)!
//                                               .tr('notHaveLogin'),
//                                           style: const TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 13.0,
//                                               fontWeight: FontWeight.w600,
//                                               fontFamily: "Sans"),
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                         top: mediaQueryData.padding.top + 225.0,
//                                         bottom: 0.0),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),

//                         /// Set Animaion after user click buttonLogin
//                         tap == 0
//                             ? InkWell(
//                                 splashColor: Colors.yellow,
//                                 onTap: () {
//                                   setState(() {
//                                     tap = 1;
//                                   });
//                                   _PlayAnimation();
//                                 },
//                                 child: const ButtonBlackBottom(),
//                               )
//                             : LoginAnimation(
//                                 animationController: sanimationController.view
//                                     as AnimationController,
//                               )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ///ButtonBlack class
