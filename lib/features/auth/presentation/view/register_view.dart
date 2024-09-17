import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/core/common/button.dart';
import 'package:rpp/core/common/text_form_field.dart';
import 'package:rpp/features/auth/domain/entity/auth_entity.dart';
import 'package:rpp/features/auth/presentation/view/login_view.dart';
import 'package:rpp/features/auth/presentation/view_model/auth_view_model.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    final authState = ref.read(authViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/app_background.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Image(
                          height: 100,
                          image: AssetImage("assets/img/app_logo.png"),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Let's Create Your Account",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: MyTextFormField(
                                    controller: _firstNameController,
                                    labelText: "First Name",
                                    prefixIcon: Icons.person,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your first name';
                                      }
                                      if (value.length < 3) {
                                        return 'Please enter a valid first name';
                                      }
                                      if (RegExp(r'^\d+$').hasMatch(value)) {
                                        return 'Please enter a valid first name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: MyTextFormField(
                                    controller: _lastNameController,
                                    labelText: "Last Name",
                                    prefixIcon: Icons.person,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your last name';
                                      }
                                      if (value.length < 3) {
                                        return 'Please enter a valid last name';
                                      }
                                      if (RegExp(r'^\d+$').hasMatch(value)) {
                                        return 'Please enter a valid last name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            MyTextFormField(
                              controller: _emailController,
                              labelText: "Email",
                              prefixIcon: Icons.email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            MyTextFormField(
                              controller: _phoneNumberController,
                              labelText: "Phone Number",
                              prefixIcon: Icons.phone_android,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                                  return 'Please enter a valid phone number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            MyTextFormField(
                              controller: _passwordController,
                              labelText: "Password",
                              prefixIcon: Icons.password_sharp,
                              obscureText: _obscureText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 5) {
                                  return 'Please enter a valid password';
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
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  activeColor: _agreedToTerms
                                      ? Colors.red
                                      : Colors.white,
                                  checkColor: Colors.white,
                                  value: _agreedToTerms,
                                  onChanged: (value) {
                                    setState(() {
                                      _agreedToTerms = value!;
                                    });
                                  },
                                ),
                                const Flexible(
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "I agree to the ",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        TextSpan(
                                          text: "Privacy Policy ",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "and ",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        TextSpan(
                                          text: "Terms of use ",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            authState.isLoading
                                ? const CircularProgressIndicator()
                                : MyButton(
                                    backgroundColor: Colors.red,
                                    text: 'Create Account',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        if (!_agreedToTerms) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Please agree to the terms and conditions'),
                                            ),
                                          );
                                          return;
                                        }
                                        ref
                                            .read(
                                                authViewModelProvider.notifier)
                                            .register(
                                              entity: AuthEntity(
                                                firstName:
                                                    _firstNameController.text,
                                                lastName:
                                                    _lastNameController.text,
                                                email: _emailController.text,
                                                phone:
                                                    _phoneNumberController.text,
                                                password:
                                                    _passwordController.text,
                                                term: _agreedToTerms.toString(),
                                              ),
                                              term: _agreedToTerms,
                                            );
                                      }
                                    },
                                  ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account? ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginView()));
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
