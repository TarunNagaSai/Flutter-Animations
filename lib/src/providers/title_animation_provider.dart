import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleModeProvider = StateProvider<HeaderData>((ref) {
  return HeaderData(color: Color(0xFF9ECFD4), title: "Cards");
});

class HeaderData {
  final String title;
  final Color color;

  HeaderData({required this.color, required this.title});
}
