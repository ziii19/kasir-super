import 'package:flutter/material.dart';
import 'package:kasir_super/core/core.dart';

class ContentSheet extends StatelessWidget {
  const ContentSheet({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 100),
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.theme.disabledColor.withOpacity(.3),
                  ),
                ),
              ],
            ),
            Dimens.dp16.height,
            child
          ],
        ),
      ),
    );
  }
}
