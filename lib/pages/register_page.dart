import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  final _confirmPwController = TextEditingController();

//register method
  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //logo
          Icon(Icons.message,
              size: 60, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 25),

          //welcome back message
          const Text('Let\'s create an account for you'),
          const SizedBox(height: 25),

          //pw textfield
          MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController),
          const SizedBox(height: 25),

          MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _pwController),
          const SizedBox(height: 25),

          MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmPwController),
          const SizedBox(height: 25),

          //login button
          MyButton(text: 'Register', onTap: register),
          const SizedBox(height: 25),

          //register now
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Already have an account?'),
            Text(' Login now', style: TextStyle(fontWeight: FontWeight.bold))
          ])
        ])));
  }
}
