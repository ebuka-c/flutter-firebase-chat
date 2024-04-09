import 'package:chat/auth/auth_service.dart';
import 'package:chat/components/my_button.dart';
import 'package:chat/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.onTap});
  final void Function()? onTap;

  final _emailController = TextEditingController();
  final _pwController = TextEditingController();

  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();

    //try login
    try {
      await authService.signInWithEmailAndPassword(
          _emailController.text, _pwController.text);
    }
    //catch any errors
    catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
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
          MyButton(text: 'Login', onTap: () => login(context)),
          const SizedBox(height: 25),

          //register now
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Not a user?'),
            GestureDetector(
                onTap: onTap,
                child: const Text(' Register now',
                    style: TextStyle(fontWeight: FontWeight.bold)))
          ])
        ])));
  }
}
