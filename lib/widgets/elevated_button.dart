import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyElevatedButton extends ConsumerWidget {
  const MyElevatedButton({
    super.key,
    this.height = 50,
    void Function()? this.onPressed,
    this.child,
  });
  final double height;
  final Function? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {},
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            minimumSize: MaterialStatePropertyAll(
              Size(400, height),
            ),
          ),
      child: child,
    );
  }
}
