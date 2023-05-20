import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/screens/login/login_screen.dart';

class LogoutAlertDialog extends ConsumerWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Se déconnecter ?'),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          child: const Text('Non'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Oui'),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Vous avez bien été déconnecté.'),
              ),
            );
          },
        ),
      ],
    );
  }
}
