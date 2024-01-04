import 'package:flutter/material.dart';
import '../api/api_service.dart';

class SignUpFunctions {
  static Future<void> signup(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController usernameController,
      TextEditingController passwordController,
      TextEditingController passwordController2) async {
    final email = emailController.text;
    final password = passwordController.text;
    final name = usernameController.text;

    final data = await ApiService.signup(email, name, password);

    if (data.containsKey('data')) {
      final dataObject = data['data'] as Map<String, dynamic>;
      if (dataObject.containsKey('status') && dataObject['status'] == 200) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pendaftaran berhasil'),
          ),
        );
      } else {
        final errorMessage = data['message'];
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Pendaftaran gagal: $errorMessage'),
          ),
        );
      }
    } else {
      Builder(
        builder: (BuildContext context) {
          final errorMessage = data['errors'];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Pendaftaran gagal ya: $errorMessage'),
            ),
          );
          return const SizedBox.shrink(); // atau widget lain jika diperlukan
        },
      );
    }
  }
}
