import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/core/common/button.dart';
import 'package:rpp/core/common/text_form_field.dart';
import 'package:rpp/features/language/easy_localization_delegate.dart';
import 'package:rpp/features/language/easy_localization_provider.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: "keharojha56@gmail.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "password");

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context)!.data;

    return EasyLocalizationProvider(
        data: data,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 56, left: 24, right: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        height: 150,
                        image: AssetImage("assets/images/applogo.png"),
                      ),
                      Text(
                        'Welcome back,',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Discover Limitless Choices with lensify",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          MyTextFormField(
                            controller: _emailController,
                            labelText:
                                AppLocalizations.of(context)!.tr('email'),
                            prefixIcon: Icons.email_outlined,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your email';
                              }
                              if (!value.contains('@')) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          MyTextFormField(
                            controller: _passwordController,
                            labelText:
                                AppLocalizations.of(context)!.tr('password'),
                            prefixIcon: Icons.password_rounded,
                            obscureText: _obscureText,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }

                              return null;
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  const SizedBox(width: 19),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .tr('rememberMe'),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins-SemiBold',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(AppLocalizations.of(context)!
                                    .tr('forgotPassword')),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              Expanded(
                                child: MyButton(
                                  backgroundColor:
                                      const Color.fromARGB(255, 2, 141, 255),
                                  text:
                                      AppLocalizations.of(context)!.tr('login'),
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                    icon: const Icon(Icons.fingerprint),
                                    onPressed: () {}),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          MyButton(
                            
                            backgroundColor:
                                const Color.fromARGB(255, 2, 141, 255),
                            text: AppLocalizations.of(context)!
                                .tr('Create Account'),
                            onPressed: () {},
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                          indent: 60,
                          endIndent: 5,
                        ),
                      ),
                      Text(AppLocalizations.of(context)!.tr('or')),
                      const Flexible(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                          indent: 5,
                          endIndent: 60,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Image(
                              height: 40,
                              width: 40,
                              image: AssetImage("assets/icon/google.png"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Image(
                              height: 40,
                              width: 40,
                              image: AssetImage("assets/icon/facebook.png"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Image(
                              height: 40,
                              width: 40,
                              image: AssetImage("assets/icon/tweeter.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
