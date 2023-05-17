import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/screens/login/password_text_field.dart';

class MyLoginFormCard extends ConsumerWidget {
  const MyLoginFormCard({super.key});

  get _authFormKey => GlobalKey();
  get _loginController => TextEditingController();
  get _passwordController => TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _authFormKey,
      child: Card(
        //TODO: add elevation card to theme
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _loginController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),
              PasswordTextField(
                controller: _passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
