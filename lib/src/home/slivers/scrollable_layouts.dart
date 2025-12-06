import 'package:animations/core/extensions_methods.dart';
import 'package:animations/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ScrollableLayouts extends StatelessWidget {
  const ScrollableLayouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [ZodiacWidget()]);
  }
}

class CylinderScroll extends StatefulWidget {
  const CylinderScroll({super.key});

  @override
  State<CylinderScroll> createState() => _CylinderScrollState();
}

class _CylinderScrollState extends State<CylinderScroll> {
  final PageController _controller = PageController(viewportFraction: 0.2);
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: PageView.builder(
        controller: _controller,
        clipBehavior: Clip.none,
        itemCount: Assets.svgs.values.length,
        itemBuilder: (context, index) {
          // Calculate distance from center
          double value = index - _currentPage;

          // This controls the curve intensity
          // value^2 makes it a parabola (arc)
          double translate = 5.0 * (value * value);

          return Transform.translate(
            offset: Offset(0, translate),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors
                      .transparent, // or any fill color (use transparent for no fill)
                  border: Border.all(
                    color: context.colors.outline, // outline color
                    width: 1.0, // outline thickness
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Assets.svgs.values[index].svg(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ZodiacWidget extends StatefulWidget {
  const ZodiacWidget({super.key});

  @override
  State<ZodiacWidget> createState() => _ZodiacWidgetState();
}

class _ZodiacWidgetState extends State<ZodiacWidget> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // usage of ShapeDecoration is key for custom shadows
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: const ArcTopShapeBorder(
          arcHeight: 50,
        ), // Custom shape defined below
        shadows: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CylinderScroll(),
            SizedBox(height: 16),
            Text("Libra"),
            Text(
              "This is a demo description about zodic signs and you can scroll and check your zodic data. Try not to be greedy and please let others also to use the data ",
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// The Custom Shape Class
// ---------------------------------------------------------
class ArcTopShapeBorder extends ShapeBorder {
  final double arcHeight;

  const ArcTopShapeBorder({this.arcHeight = 30.0});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(top: arcHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // For a simple border, inner path can be same as outer
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();

    // 1. Start at the top-left (shifted down by arcHeight)
    path.moveTo(rect.left, rect.top + arcHeight);

    // 2. Draw the Arc to top-right
    // We use a Quadratic Bezier Curve.
    // Control point is in the top-center (rect.top).
    // End point is top-right (rect.top + arcHeight).
    path.quadraticBezierTo(
      rect.center.dx, // Control Point X (Center)
      rect.top, // Control Point Y (Top of bounding box)
      rect.right, // End Point X
      rect.top + arcHeight, // End Point Y
    );

    // 3. Draw line to bottom-right
    path.lineTo(rect.right, rect.bottom);

    // 4. Draw line to bottom-left
    path.lineTo(rect.left, rect.bottom);

    // 5. Close the path (draws line back to start)
    path.close();

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // No painting needed here; ShapeDecoration handles the fill and shadow
    // using the path provided by getOuterPath.
  }

  @override
  ShapeBorder scale(double t) {
    return ArcTopShapeBorder(arcHeight: arcHeight * t);
  }
}

class FancyScrollCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double scale;
  final double opacity;

  const FancyScrollCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.scale,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Transform.scale(
        scale: scale,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                spreadRadius: 4,
                blurRadius: 22,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IMAGE
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(image, fit: BoxFit.cover),
                ),

                // TEXT SECTION
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FancyScrollList extends StatefulWidget {
  const FancyScrollList({super.key});

  @override
  State<FancyScrollList> createState() => _FancyScrollListState();
}

class _FancyScrollListState extends State<FancyScrollList> {
  final ScrollController controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.only(top: 50, bottom: 50),
      itemCount: 20,
      itemBuilder: (context, i) {
        final double cardOffset = (i * 260) - offset; // approx height
        final double dist = (cardOffset / 300).clamp(-1.0, 1.0);

        final double scale = 1 - (dist.abs() * 0.15);
        final double opacity = 1 - (dist.abs() * 0.3);

        return FancyScrollCard(
          image: "https://picsum.photos/id/${i + 20}/800/400",
          title: "Card Title $i",
          subtitle: "Subtitle description",
          scale: scale,
          opacity: opacity,
        );
      },
    );
  }
}
