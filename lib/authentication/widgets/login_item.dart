import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  // Mengubah menjadi StatefulWidget
  final String labelText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final bool isPassword;
  final double textFieldWidth;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.prefixIcon,
    this.isPassword = false,
    required this.textFieldWidth,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false; // Pindahkan ke dalam _CustomTextFieldState

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.textFieldWidth,
        child: TextField(
          controller: widget.controller,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: widget.labelText,
            prefixIcon:
                widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              // ignore: prefer_const_constructors
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Color(0xFF9E9E9E),
                width: 2.0,
              ),
            ),
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        // Perlu dipanggil setState untuk mengubah isPasswordVisible
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
          ),
          obscureText: widget.isPassword ? !isPasswordVisible : false,
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color buttonColor;
  final Color textColor;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 260,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: buttonColor.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: const BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
