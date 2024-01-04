import 'package:aplikasi_ecommerce/home/screens/navbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_service.dart';
import '../widgets/notification.dart';

class LoginFunctions {
  LoginFunctions(BuildContext context);

  static Future<void> login(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      SnackbarUtil.showSnackbar(
          context, 'Email and Password must be filled', false);
      return;
    }

    final data = await ApiService.login(email, password);

    if (data.containsKey('data')) {
      final dataObject = data['data'] as Map<String, dynamic>;
      if (dataObject.containsKey('token')) {
        String token = dataObject['token'] as String;
        saveTokenLocally(token);
        // ignore: use_build_context_synchronously
        navigateToNavBar(context, token);
        // ignore: use_build_context_synchronously
        SnackbarUtil.showSnackbar(context, 'Login succes', true);
      }
    } else {
      // ignore: use_build_context_synchronously
      SnackbarUtil.showSnackbar(context, 'Password or Email Is Wrong', false);
    }
  }

  static void navigateToNavBar(BuildContext context, String token) {
    Future.delayed(Duration.zero, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavBarBottom(authToken: token)),
      );
    });
  }

  static Future<void> saveTokenLocally(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getTokenLocally() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }
}
