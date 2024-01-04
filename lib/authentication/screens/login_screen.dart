import 'package:aplikasi_ecommerce/authentication/screens/forgot_screen.dart';
import 'package:aplikasi_ecommerce/authentication/widgets/login_item.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_ecommerce/authentication/screens/signup_screen.dart';
import 'package:aplikasi_ecommerce/authentication/service/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(),
            child: Center(
              child: Column(
                children: [
                  Container(
                    // ignore: sort_child_properties_last
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    width: screenSize.width > 600 ? 400 : screenSize.width,
                    height: screenSize.height > 800 ? 400 : 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/decoration1.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    height: screenSize.height >= 800 ? 500 : 420,
                    width: screenSize.width >= 600 ? 400 : 300,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40.0),
                        CustomTextField(
                          labelText: 'Email',
                          controller: _emailController,
                          prefixIcon: Icons.email,
                          textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          labelText: 'Password',
                          controller: _passwordController,
                          prefixIcon: Icons.lock,
                          isPassword: true,
                          textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                        ),
                        const SizedBox(height: 5.0),
                        _buildForgotPasswordButton(context),
                        const SizedBox(height: 10.0),
                        Center(
                          child: CustomElevatedButton(
                            onPressed: () {
                              LoginFunctions.login(context, _emailController,
                                  _passwordController);
                            },
                            text: 'Login',
                            buttonColor:
                                const Color.fromARGB(255, 0, 60, 255).withOpacity(0.8),
                            textColor: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildSignUpButton(context),
                        const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.only(left: 25),
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: Colors.lightGreen,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/icongoogle.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                const Text(' Login With Google'),
                              ],
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
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Checkbox(
            value: rememberMe,
            onChanged: (newValue) {
              setState(() {
                rememberMe = newValue!;
              });
            },
            shape: const CircleBorder(),
          ),
          const Text(
            'Remember Me',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(
            width: 40,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPassword(),
                ),
              );
            },
            child: const Text(
              'Forgot Password',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        child: Row(
          children: [
            const Text("don't have an account? "),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  ),
                );
              },
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
