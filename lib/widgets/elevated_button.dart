import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyElevatedButton extends ConsumerWidget {
  const MyElevatedButton({
    super.key,
    this.height = 50,
    this.onPressed,
    this.child,
  });
  final double height;
  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            minimumSize: MaterialStatePropertyAll(
              Size(400, height),
            ),
          ),
      child: child,
    );
  }
}
