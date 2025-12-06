import 'package:animations/src/providers/title_animation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LayoutWidget extends ConsumerStatefulWidget {
  const LayoutWidget({
    super.key,
    required this.child,
    required this.sectionKey,
    required this.headerData,
  });

  final Widget child;
  final GlobalKey sectionKey;
  final HeaderData headerData;

  @override
  ConsumerState<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends ConsumerState<LayoutWidget> {
  // Map to track visibility of all slivers
  double visibilityMap = 0.0;
  late String mostVisibleSliver;
  void _updateMostVisibleSliver() {
    final visibilityRatio = visibilityMap;
    final mostVisibleSliver = ref.watch(titleModeProvider);
    if (visibilityRatio >= 0.84 &&
        mostVisibleSliver != widget.headerData.title &&
        mounted) {
      ref.read(titleModeProvider.notifier).state = widget.headerData;
    }
  }

  @override
  Widget build(BuildContext context) {
    mostVisibleSliver = ref.watch(titleModeProvider).title;
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        /// Calculate the total extent of your sliver content
        final sliverHeight = MediaQuery.of(context).size.height;

        /// Calculate visible portion
        final overlap = constraints.overlap;
        final remainingPaint = constraints.remainingPaintExtent;

        double visibleHeight;
        if (overlap > 0) {
          visibleHeight = (sliverHeight - overlap).clamp(0.0, sliverHeight);
        } else {
          visibleHeight = remainingPaint.clamp(0.0, sliverHeight);
        }

        /// Check the visibility
        final visibilityRatio = visibleHeight / sliverHeight;

        // Store visibility for this sliver
        visibilityMap = visibilityRatio;

        // This will run after EVERY frame where build is called
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateMostVisibleSliver();
        });

        return SliverToBoxAdapter(
          child: SizedBox(
            key: widget.sectionKey,
            height: MediaQuery.of(context).size.height,
            child: widget.child,
          ),
        );
      },
    );
  }
}
