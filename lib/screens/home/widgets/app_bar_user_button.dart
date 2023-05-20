import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/screens/home/widgets/logout_alert_dialog.dart';

class MyAppBarUserButton extends ConsumerWidget {
  const MyAppBarUserButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(30),
        right: Radius.circular(30),
      ),
      child: Material(
        color: Colors.transparent,
        child: PopupMenuButton<Text>(
          tooltip: "Ouvrir le menu",
          position: PopupMenuPosition.under,
          child: Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            child: Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Aldn A",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: const Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 10),
                    Text('Déconnexion'),
                  ],
                ),
                onTap: () {
                  Future.delayed(const Duration(seconds: 0), () {
                    showDialog(
                      context: context,
                      builder: (context) => const LogoutAlertDialog(),
                    );
                  });
                },
              ),
            ];
          },
        ),
      ),
    );
  }
}
