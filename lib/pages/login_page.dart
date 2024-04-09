import 'package:chat/components/my_button.dart';
import 'package:chat/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _emailController = TextEditingController();
  final _pwController = TextEditingController();

  void login() {}

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
          const Text('Welcome back'),
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

          //login button
          MyButton(text: 'Login', onTap: login),
          const SizedBox(height: 25),

          //register now
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Not a user?'),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/register'),
                child: const Text(' Register now',
                    style: TextStyle(fontWeight: FontWeight.bold)))
          ])
        ])));
  }
}
