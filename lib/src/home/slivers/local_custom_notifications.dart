import 'package:animations/core/extensions_methods.dart';
import 'package:flutter/material.dart';

class LocalCustomNotifications extends StatelessWidget {
  const LocalCustomNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.colors.surfaceContainer),
      child: Text("Local Custom Notifications Coming Soon!"),
    );
  }
}
