import 'package:flutter/material.dart';
import 'package:learnflow_backoffice/screens/home/widgets/app_bar_button.dart';
import 'package:learnflow_backoffice/screens/home/widgets/app_bar_user_button.dart';

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
              MyAppBarButton(
                tooltip: "Courriel",
                onPressed: () {},
                icon: const Icon(Icons.mail_outline),
              ),
              const SizedBox(width: 10),
              MyAppBarButton(
                tooltip: "Notification",
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
              const SizedBox(width: 10),
              const MyAppBarUserButton(),
            ],
          ),
        ],
      ),
    );
  }
}
