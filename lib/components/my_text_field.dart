import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.hintText,
      this.obscureText,
      required this.controller});

  final String hintText;
  final bool? obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: obscureText ?? false,
        controller: controller,
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary)),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)),
      ),
    );
  }
}
