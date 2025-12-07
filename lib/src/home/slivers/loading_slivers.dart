import 'package:animations/core/extensions_methods.dart';
import 'package:flutter/material.dart';

class LoadingSlivers extends StatelessWidget {
  const LoadingSlivers({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.colors.surfaceContainer),
      child: Text("Loaders Widgets Coming Soon!"),
    );
  }
}
