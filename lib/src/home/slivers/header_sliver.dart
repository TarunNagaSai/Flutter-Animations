import 'package:animations/src/home/slivers/stacked_header.dart';
import 'package:animations/src/providers/theme_provider.dart';
import 'package:animations/src/providers/title_animation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeaderSliver extends ConsumerStatefulWidget {
  const HeaderSliver({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  ConsumerState<HeaderSliver> createState() => _HeaderSliverState();
}

class _HeaderSliverState extends ConsumerState<HeaderSliver>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final title = ref.watch(titleModeProvider).title;
    final color = ref.watch(titleModeProvider).color;
    return SliverPersistentHeader(
      delegate: StickyHeaderDelegate(
        builder: (isPinned, sizeWidth) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: color,
              borderRadius: !isPinned
                  ? null
                  : BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                    ),
            ),

            child: Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 16),
              child: AnimatedAlign(
                alignment: isPinned ? .bottomCenter : .center,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Expanded(
                      child: SequentialTextSwitcher(
                        text: title,
                        scrollController: widget.scrollController,
                      ),
                    ),
                    ThemeWidget(isPinned: isPinned),
                  ],
                ),
              ),
            ),
          );
        },
        minHeight: 120,
        maxHeight: 160,
      ),
      pinned: true,
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    required this.scrollDirection,
  });

  final ScrollDirection scrollDirection;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        final outAnimation = Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-1.0, 0.0), // slide left
        ).animate(animation);

        final inAnimation = Tween<Offset>(
          begin: const Offset(3.0, 0.0), // from right
          end: Offset.zero,
        ).animate(animation);

        // NEW widget → use inAnimation
        // OLD widget → use outAnimation
        if (animation.status == AnimationStatus.forward) {
          return SlideTransition(position: inAnimation, child: child);
        } else {
          return SlideTransition(position: outAnimation, child: child);
        }
      },
      child: Text(
        title,
        key: ValueKey(title),
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// A widget that toggles between light and dark theme icons with animation.
class ThemeWidget extends StatefulWidget {
  const ThemeWidget({super.key, required this.isPinned});
  final bool isPinned;
  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget>
    with TickerProviderStateMixin {
  bool isDark = false;
  late final Animation<double> _fade;
  late final AnimationController _fadeAnimationController;

  @override
  void initState() {
    super.initState();

    /// Fade Animation
    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fade = CurvedAnimation(
      parent: _fadeAnimationController,
      curve: Curves.easeIn,
    );
  }

  @override
  void didUpdateWidget(covariant ThemeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isPinned != oldWidget.isPinned) {
      if (widget.isPinned) {
        _fadeAnimationController.forward();
      } else {
        _fadeAnimationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Consumer(
          builder: (context, ref, _) {
            isDark = Theme.of(context).brightness == Brightness.dark;
            return IconButton(
              tooltip: 'Toggle Theme',
              onPressed: () {
                ref.read(themeModeProvider.notifier).state = isDark
                    ? ThemeMode.light
                    : ThemeMode.dark;
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) {
                  // Slide down old icon, slide up new icon
                  final inAnimation = Tween<Offset>(
                    begin: const Offset(0, 0.5),
                    end: Offset.zero,
                  ).animate(animation);
                  if (child.key == const ValueKey('dark')) {
                    // dark icon coming up
                    return ClipRect(
                      child: SlideTransition(
                        position: inAnimation,
                        child: child,
                      ),
                    );
                  } else {
                    // light icon coming up
                    return ClipRect(
                      child: SlideTransition(
                        position: inAnimation,
                        child: child,
                      ),
                    );
                  }
                },
                child: isDark
                    ? const Icon(
                        Icons.light_mode,
                        key: ValueKey('light'),
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.dark_mode,
                        key: ValueKey('dark'),
                        color: Colors.white,
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}

///
class SequentialTextSwitcher extends StatefulWidget {
  final String text;
  final ScrollController scrollController;
  const SequentialTextSwitcher({
    super.key,
    required this.text,
    required this.scrollController,
  });

  @override
  State<SequentialTextSwitcher> createState() => _SequentialTextSwitcherState();
}

class _SequentialTextSwitcherState extends State<SequentialTextSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _oldSlide;
  late Animation<Offset> _newSlide;

  String _oldText = "Cards";
  String _newText = "Cards";
  double previousOffset = 0;
  bool isScrollingDown = true;

  @override
  void initState() {
    super.initState();
    _newText = widget.text;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _setupAnimations();
  }

  void _setupAnimations() {
    final double currentOffset = widget.scrollController.offset;

    bool isScrollingDown = currentOffset > previousOffset;

    final beginOld = isScrollingDown ? Offset.zero : Offset.zero;
    final endOld = isScrollingDown
        ? const Offset(-1.0, 0.0)
        : const Offset(3.0, 0.0);

    final beginNew = isScrollingDown
        ? const Offset(3.0, 0.0)
        : const Offset(-1.0, 0.0);
    final endNew = Offset.zero;

    // Common curves reused
    final slideOutCurve = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    );

    final slideInCurve = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    );

    _oldSlide = Tween<Offset>(
      begin: beginOld,
      end: endOld,
    ).animate(slideOutCurve);
    _newSlide = Tween<Offset>(
      begin: beginNew,
      end: endNew,
    ).animate(slideInCurve);
    previousOffset = currentOffset;
  }

  @override
  void didUpdateWidget(covariant SequentialTextSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.text != widget.text) {
      _oldText = oldWidget.text;
      _newText = widget.text;

      _controller.forward(from: 0.0);
      _setupAnimations();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              // OLD TEXT (first phase)
              if (_controller.value < 0.5)
                SlideTransition(
                  position: _oldSlide,
                  child: Text(_oldText, style: _textStyle),
                ),

              // NEW TEXT (second phase)
              if (_controller.value >= 0.25)
                SlideTransition(
                  position: _newSlide,
                  child: Text(_newText, style: _textStyle),
                ),
            ],
          );
        },
      ),
    );
  }

  TextStyle get _textStyle => const TextStyle(
    fontSize: 32,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
