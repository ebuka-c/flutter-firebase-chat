import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, this.onTap});

  final void Function()? onTap;

  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  final _confirmPwController = TextEditingController();

  //get auth service
  final _auth = AuthService();

//register method
  void register(BuildContext context) {
    if (_pwController.text == _confirmPwController.text) {
      //if the passwords match, create user
      try {
        _auth.signUpWithEmailAndPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
    //if passwords don't match show an error
    else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
              title: Center(
                  child: Text('Passwords don\'t match',
                      style: TextStyle(fontSize: 16)))));
    }
  }

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
          MyButton(text: 'Register', onTap: () => register(context)),
          const SizedBox(height: 25),

          //register now
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Already have an account?'),
            GestureDetector(
                onTap: onTap,
                child: const Text(' Login now',
                    style: TextStyle(fontWeight: FontWeight.bold)))
          ])
        ])));
  }
}
