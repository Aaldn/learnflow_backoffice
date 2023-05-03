import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final railIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class MyNavigationRail extends ConsumerWidget {
  const MyNavigationRail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationRail(
      selectedIndex: ref.watch(railIndexProvider),
      onDestinationSelected: (value) {
        ref.watch(railIndexProvider.notifier).state = value;
      },
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.favorite),
          label: Text('First'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bookmark_border),
          selectedIcon: Icon(Icons.book),
          label: Text('Second'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.star_border),
          selectedIcon: Icon(Icons.star),
          label: Text('Third'),
        ),
      ],
    );
  }
}
