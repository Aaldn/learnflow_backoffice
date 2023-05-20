import 'package:flutter/material.dart';
import 'package:learnflow_backoffice/screens/home/widgets/logout_alert_dialog.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.subScreen});

  final String subScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subScreen,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mail_outline),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
              const SizedBox(width: 12),
              InkWell(
                customBorder: const StadiumBorder(),
                onTap: () {},
                child: Row(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                      child: PopupMenuButton<Text>(
                        position: PopupMenuPosition.under,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                "Aldn A",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
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
                                    builder: (context) {
                                      return const LogoutAlertDialog();
                                    },
                                  );
                                });
                              },
                            ),
                          ];
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
