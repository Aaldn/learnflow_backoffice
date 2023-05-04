import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/widgets/rail_logout_button.dart';

final railIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class MyNavigationRail extends ConsumerWidget {
  const MyNavigationRail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationRail(
      useIndicator: true,
      labelType: NavigationRailLabelType.all,
      selectedIndex: ref.watch(railIndexProvider),
      onDestinationSelected: (value) {
        ref.watch(railIndexProvider.notifier).state = value;
      },
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard),
          label: Text('Tableau de bord'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.table_view),
          selectedIcon: Icon(Icons.table_view_outlined),
          label: Text('Gestion'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
      ],
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                RailLogoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
