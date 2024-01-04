// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:aplikasi_ecommerce/authentication/screens/login_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/forgotPass.png"),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'Enter Your Email',
              style: TextStyle(fontSize: 12),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildForgotButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildForgotButton(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 40),
        height: 50,
        width: 200,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
            // Navigator.pushNamed(context, '/signup');
          },
          child: Text(
            "Send",
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
