import 'package:aplikasi_ecommerce/authentication/service/signup_service.dart';
import 'package:aplikasi_ecommerce/authentication/widgets/login_item.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_ecommerce/authentication/screens/login_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: screenSize.width > 600 ? 400 : screenSize.width,
                  height: screenSize.height > 800 ? 400 : 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/decoration1.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                Container(
                  height: screenSize.height >= 800 ? 600 : 450,
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
                      const SizedBox(height: 10.0),
                      CustomTextField(
                        labelText: "Username",
                        controller: _usernameController,
                        prefixIcon: Icons.person,
                        textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Email",
                        controller: _emailController,
                        prefixIcon: Icons.email,
                        textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                      ),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                        labelText: "Password",
                        controller: _passwordController,
                        prefixIcon: Icons.lock,
                        isPassword: true,
                        textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Confirmation Password",
                        controller: _passwordController2,
                        prefixIcon: Icons.lock,
                        isPassword: true,
                        textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                      ),
                      const SizedBox(height: 30.0),
                      CustomElevatedButton(
                        onPressed: () {
                          SignUpFunctions.signup(
                            context,
                            _emailController,
                            _usernameController,
                            _passwordController,
                            _passwordController2,
                          );
                        },
                        text: 'Sign Up',
                        buttonColor: const Color(0XFFBF00FF).withOpacity(0.8),
                        textColor: Colors.white,
                      ),
                      const SizedBox(height: 8.0),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(left: 60, right: 60),
                          child: Row(
                            children: [
                              const Text('Have an account?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  );
                                },
                                child: const Text("Login"),
                              ),
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
    );
  }
}
