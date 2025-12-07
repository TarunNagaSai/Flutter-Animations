import 'dart:math';

import 'package:animations/core/extensions_methods.dart';
import 'package:animations/src/home/clip_arts/highlight_paths.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ClipArtWidgets extends StatelessWidget {
  const ClipArtWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.colors.surfaceContainer),
      child: Column(
        mainAxisSize: .min,
        children: [
          SizedBox(height: 16),
          Flexible(fit: FlexFit.loose, child: ShapeMatchingGame()),
          SizedBox(height: 16),
          RichText(
            text: CustomTextSpan(
              text: "   Custom Highlighted Text   ",
              highlight: true,
              style: context.themeText.bodyMedium!.copyWith(
                height: 2,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 1. Data Model for our Shapes
class ShapeItem {
  final String name;
  final IconData icon;
  final Color color;

  ShapeItem({required this.name, required this.icon, required this.color});
}

class ShapeMatchingGame extends StatefulWidget {
  const ShapeMatchingGame({super.key});

  @override
  State<ShapeMatchingGame> createState() => _SmoothMatchGameState();
}

class _SmoothMatchGameState extends State<ShapeMatchingGame> {
  // 2. Define the game data
  final List<ShapeItem> _allShapes = [
    ShapeItem(name: "Circle", icon: Icons.circle, color: Colors.red),
    ShapeItem(name: "Square", icon: Icons.square_rounded, color: Colors.blue),
    ShapeItem(
      name: "Triangle",
      icon: Icons.change_history,
      color: Colors.orange,
    ),
    ShapeItem(name: "Star", icon: Icons.star, color: Colors.purple),
    ShapeItem(name: "Heart", icon: Icons.favorite, color: Colors.pink),
  ];

  late List<ShapeItem> _shuffledItems;
  late List<ShapeItem> _targetItems;
  late ConfettiController _controllerCenter;

  // Tracks which items have been correctly matched
  final Map<String, bool> _isMatched = {};
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    // Determine the order:
    // _shuffledItems = The list on the Left (Draggables)
    // _targetItems = The list on the Right (Drop Zones)

    _targetItems = List.from(_allShapes);
    _shuffledItems = List.from(_allShapes)..shuffle(); // Randomize left side

    _isMatched.clear();
    _score = 0;

    // Initialize all as not matched
    for (var item in _allShapes) {
      _isMatched[item.name] = false;
    }
    _controllerCenter = ConfettiController(
      duration: const Duration(seconds: 3),
    );

    setState(() {});
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degrees to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(
        halfWidth + externalRadius * cos(step),
        halfWidth + externalRadius * sin(step),
      );
      path.lineTo(
        halfWidth + internalRadius * cos(step + halfDegreesPerStep),
        halfWidth + internalRadius * sin(step + halfDegreesPerStep),
      );
    }
    path.close();
    return path;
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            "Drag the shape to its outline!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Stack(
            children: [
              Row(
                children: [
                  // ------------------------------
                  // LEFT COLUMN: Draggable Items
                  // ------------------------------
                  Expanded(
                    child: Column(
                      mainAxisSize: .min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _shuffledItems.map((item) {
                        // If already matched, hide the draggable (optional: or show checkmark)
                        return _isMatched[item.name]!
                            ? Icon(
                                item.icon,
                                size: 50,
                                color: Colors.grey[300],
                              ) // Empty placeholder
                            : _buildDraggableItem(item);
                      }).toList(),
                    ),
                  ),

                  // Spacer in the middle
                  const SizedBox(width: 50),

                  // ------------------------------
                  // RIGHT COLUMN: Drop Targets
                  // ------------------------------
                  Expanded(
                    child: Column(
                      mainAxisSize: .min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _targetItems.map((item) {
                        return _buildDragTarget(item);
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: ConfettiWidget(
                  confettiController: _controllerCenter,
                  blastDirectionality: BlastDirectionality
                      .explosive, // don't specify a direction, blast randomly
                  numberOfParticles: 50,

                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple,
                  ], // manually specify the colors to be used
                  createParticlePath: drawStar, // define a custom shape/path.
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Win Message
          if (_score == _allShapes.length) Center(child: Text("You Got 5 ⭐️")),
        ],
      ),
    );
  }

  // Helper to build the Draggable Widget (Left Side)
  Widget _buildDraggableItem(ShapeItem item) {
    return Draggable<ShapeItem>(
      data: item, // The data we are passing
      // What looks like when dragging
      feedback: Icon(item.icon, size: 50, color: item.color.withOpacity(0.7)),

      // What remains in original place while dragging
      childWhenDragging: Icon(item.icon, size: 50, color: Colors.grey[300]),

      // Normal state
      child: Icon(item.icon, size: 50, color: item.color),
    );
  }

  // Helper to build the Drop Zone (Right Side)
  Widget _buildDragTarget(ShapeItem item) {
    return DragTarget<ShapeItem>(
      // 1. Logic to accept data
      onWillAccept: (receivedItem) {
        // Only accept if the names match (e.g., Circle == Circle)
        return receivedItem?.name == item.name;
      },

      // 2. Logic when dropped successfully
      onAccept: (receivedItem) {
        setState(() {
          _isMatched[item.name] = true;
          _score++;
        });
        if (_score == _allShapes.length) _controllerCenter.play();
      },

      // 3. The Visual Widget
      builder: (context, candidateData, rejectedData) {
        // If already matched, show the full colored icon
        if (_isMatched[item.name]!) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: Icon(item.icon, size: 50, color: item.color),
          );
        }

        // If not matched yet, show the OUTLINE
        return Icon(
          item.icon,
          size: 50,
          color: Colors.grey[400], // Greyed out icon inside
        );
      },
    );
  }
}

class CustomTextSpan extends TextSpan {
  CustomTextSpan({
    bool highlight = false,
    required String text,
    TextStyle style = const TextStyle(fontSize: 16),
    Color backgroundColor = const Color(0xFFFCDEC2),
  }) : super(
         children: [
           WidgetSpan(
             alignment: PlaceholderAlignment.baseline,
             baseline: TextBaseline.alphabetic,
             child: CustomPaint(
               painter: highlight
                   ? CustomTextBackgroundPainter(backgroundColor)
                   : null,
               child: Text(text, style: style),
             ),
           ),
         ],
       );
}

class CustomTextBackgroundPainter extends CustomPainter {
  final Color color;

  CustomTextBackgroundPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = HighlighterPath().getPath(size);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
