import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/core/common/button.dart';
import 'package:rpp/core/common/text_form_field.dart';
import 'package:rpp/features/auth/presentation/view/register_view.dart';
import 'package:rpp/features/auth/presentation/view_model/auth_view_model.dart';
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
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    var data = EasyLocalizationProvider.of(context)!.data;

    return EasyLocalizationProvider(
        data: data,
        child: SafeArea(
          child: Scaffold(
            // for linear gradient
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/app_background.png"),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 56, left: 24, right: 24, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Image(
                              height: 150,
                              image: AssetImage("assets/img/app_logo.png"),
                            ),
                          ),
                          const Center(
                            child: Text(
                              'Welcome back,',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .tr("Access the updates and join the party "),
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 10),
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
                                labelText: AppLocalizations.of(context)!
                                    .tr('password'),
                                prefixIcon: Icons.password_rounded,
                                obscureText: _obscureText,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .tr('Enter your password');
                                  }
                                  if (value.length < 6) {
                                    return AppLocalizations.of(context)!.tr(
                                        'Password must be at least 8 characters with one uppercase');
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Checkbox(
                                          activeColor: _rememberMe
                                              ? Colors.red
                                              : Colors.white,
                                          checkColor: Colors.white,
                                          value: _rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              _rememberMe = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 19),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .tr('Remember Me'),
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
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.blue,
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .tr('Forgot Password'),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              authState.isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : Row(
                                      children: [
                                        Expanded(
                                          child: MyButton(
                                            backgroundColor: Colors.red,
                                            text: AppLocalizations.of(context)!
                                                .tr('login'),
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                ref
                                                    .read(authViewModelProvider
                                                        .notifier)
                                                    .login(
                                                      email:
                                                          _emailController.text,
                                                      password:
                                                          _passwordController
                                                              .text,
                                                    );
                                              }
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: IconButton(
                                              icon: const Icon(
                                                  Icons.fingerprint,
                                                  color: Colors.red),
                                              onPressed: () {}),
                                        ),
                                      ],
                                    ),
                              const SizedBox(height: 16),
                              MyButton(
                                backgroundColor: Colors.red,
                                text: AppLocalizations.of(context)!
                                    .tr('Create Account'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView(),
                                    ),
                                  );
                                },
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
            ),
          ),
        ));
  }
}
