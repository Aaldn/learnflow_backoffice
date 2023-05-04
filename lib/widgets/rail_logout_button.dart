import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/widgets/logout_alert_dialog.dart';

class RailLogoutButton extends ConsumerWidget {
  const RailLogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const LogoutAlertDialog(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Icon(Icons.logout, color: Colors.grey),
            Text("Déconnexion"),
          ],
        ),
      ),
    );
  }
}
