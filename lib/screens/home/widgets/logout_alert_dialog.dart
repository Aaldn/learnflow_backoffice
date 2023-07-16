import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/screens/login/login_screen.dart';
import 'package:learnflow_backoffice/services/api/api_service.dart';
import 'package:learnflow_backoffice/services/authentication/secure_storage.dart';

class LogoutAlertDialog extends ConsumerStatefulWidget {
  const LogoutAlertDialog({super.key});

  @override
  ConsumerState<LogoutAlertDialog> createState() => _LogoutAlertDialogState();
}

class _LogoutAlertDialogState extends ConsumerState<LogoutAlertDialog> {
  @override
  Widget build(BuildContext context) {
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
          onPressed: () async {
            try {
              final apiToken =
                  await ref.read(secureStorageProvider).getApiToken();
              await ref.read(apiServiceProvider(apiToken)).logout();
              await ref.read(secureStorageProvider).setApiToken(null);
              if (!mounted) return;
              Navigator.of(context).pop();
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
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Impossible de se déconnecter. Veuillez réessayer.',
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
