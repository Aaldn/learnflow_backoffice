import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/screens/home/widgets/dashboard_sub_screen.dart';
import 'package:learnflow_backoffice/screens/home/widgets/management_sub_screen.dart';
import 'package:learnflow_backoffice/screens/home/widgets/settings_sub_screen.dart';
import 'package:learnflow_backoffice/widgets/navigation_rail.dart.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  static const subScreens = [
    DashboardSubScreen(),
    ManagementSubScreen(),
    SettingsSubScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSubScreenIndex = ref.watch(railIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Espace Manager"),
      ),
      body: Row(
        children: [
          const MyNavigationRail(),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: subScreens[currentSubScreenIndex],
          ),
        ],
      ),
    );
  }
}
