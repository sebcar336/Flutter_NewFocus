import 'package:flutter/material.dart';
import 'package:new_focus_/styles/palleta.dart';

import 'login_button.dart';
import 'login_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/img/login_balls.png',
              ),
              const SizedBox(
                height: 35,
              ),
              Image.asset(
                'assets/img/login_logo.png',
                width: 85,
                height: 130,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Sign in',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 37,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                          color: Pallete.borderColor, width: 3),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 38, vertical: 14),
                  ),
                ),
                child: const Text(
                  'Continue with Google',
                  style: TextStyle(
                    color: Pallete.text,
                    fontSize: 16.5,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'or',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 18),
              const LoginField(hintText: '  Email:'),
              const SizedBox(height: 12),
              const LoginField(hintText: '  Password:'),
              const SizedBox(height: 45),
              const LoginButton(),
              const SizedBox(height: 48),
              Center(
                child: Transform.rotate(
                  angle: 3.09999,
                  child: Image.asset(
                    'assets/img/login_balls.png',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
