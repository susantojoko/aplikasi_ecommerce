import 'package:flutter/material.dart';

class SnackbarUtil {
  static void showSnackbar(
      BuildContext context, String message, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Colors.blue : Colors.red,
      ),
    );
  }
}
