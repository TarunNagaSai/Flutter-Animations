import 'package:flutter/material.dart';

class HighlighterPath {
  Path getPath(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.04, size.height * 0.96);
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.96,
      size.width * 0.04,
      size.height * 0.98,
      size.width * 0.04,
      size.height * 0.98,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height,
      size.width * 0.05,
      size.height * 1.02,
      size.width * 0.06,
      size.height * 1.02,
    );
    path.cubicTo(
      size.width * 0.09,
      size.height * 1.02,
      size.width * 0.16,
      size.height * 1.02,
      size.width * 0.16,
      size.height,
    );
    path.cubicTo(
      size.width * 0.16,
      size.height,
      size.width * 0.24,
      size.height,
      size.width * 0.28,
      size.height,
    );
    path.cubicTo(
      size.width * 0.31,
      size.height,
      size.width / 2,
      size.height,
      size.width * 0.58,
      size.height,
    );
    path.cubicTo(
      size.width * 0.61,
      size.height,
      size.width * 0.64,
      size.height,
      size.width * 0.66,
      size.height,
    );
    path.cubicTo(
      size.width * 0.7,
      size.height,
      size.width * 0.74,
      size.height * 0.98,
      size.width * 0.74,
      size.height,
    );
    path.cubicTo(
      size.width * 0.74,
      size.height,
      size.width * 0.84,
      size.height,
      size.width * 0.85,
      size.height * 0.98,
    );
    path.cubicTo(
      size.width * 0.86,
      size.height * 0.98,
      size.width * 0.86,
      size.height * 0.98,
      size.width * 0.86,
      size.height * 0.98,
    );
    path.cubicTo(
      size.width * 0.86,
      size.height * 0.98,
      size.width * 0.92,
      size.height * 0.98,
      size.width * 0.97,
      size.height * 0.98,
    );
    path.cubicTo(
      size.width * 1.03,
      size.height * 0.98,
      size.width,
      size.height * 0.97,
      size.width * 0.98,
      size.height * 0.96,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.96,
      size.width * 0.98,
      size.height * 0.96,
      size.width * 0.98,
      size.height * 0.96,
    );
    path.cubicTo(
      size.width * 0.97,
      size.height * 0.95,
      size.width * 0.97,
      size.height * 0.94,
      size.width * 0.98,
      size.height * 0.94,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.94,
      size.width * 0.98,
      size.height * 0.92,
      size.width * 0.98,
      size.height * 0.92,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.91,
      size.width * 0.98,
      size.height * 0.91,
      size.width * 0.98,
      size.height * 0.91,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.91,
      size.width * 0.98,
      size.height * 0.91,
      size.width * 0.98,
      size.height * 0.91,
    );
    path.cubicTo(
      size.width,
      size.height * 0.9,
      size.width,
      size.height * 0.9,
      size.width,
      size.height * 0.9,
    );
    path.cubicTo(
      size.width,
      size.height * 0.9,
      size.width,
      size.height * 0.89,
      size.width,
      size.height * 0.89,
    );
    path.cubicTo(
      size.width,
      size.height * 0.89,
      size.width,
      size.height * 0.89,
      size.width,
      size.height * 0.89,
    );
    path.cubicTo(
      size.width,
      size.height * 0.89,
      size.width,
      size.height * 0.89,
      size.width,
      size.height * 0.89,
    );
    path.cubicTo(
      size.width,
      size.height * 0.89,
      size.width,
      size.height * 0.88,
      size.width,
      size.height * 0.88,
    );
    path.cubicTo(
      size.width,
      size.height * 0.88,
      size.width,
      size.height * 0.87,
      size.width,
      size.height * 0.87,
    );
    path.cubicTo(
      size.width,
      size.height * 0.87,
      size.width,
      size.height * 0.87,
      size.width,
      size.height * 0.87,
    );
    path.cubicTo(
      size.width,
      size.height * 0.87,
      size.width,
      size.height * 0.86,
      size.width,
      size.height * 0.86,
    );
    path.cubicTo(
      size.width,
      size.height * 0.86,
      size.width,
      size.height * 0.86,
      size.width,
      size.height * 0.85,
    );
    path.cubicTo(
      size.width,
      size.height * 0.85,
      size.width,
      size.height * 0.85,
      size.width,
      size.height * 0.85,
    );
    path.cubicTo(
      size.width,
      size.height * 0.85,
      size.width,
      size.height * 0.85,
      size.width,
      size.height * 0.85,
    );
    path.cubicTo(
      size.width,
      size.height * 0.85,
      size.width,
      size.height * 0.84,
      size.width,
      size.height * 0.84,
    );
    path.cubicTo(
      size.width,
      size.height * 0.84,
      size.width,
      size.height * 0.84,
      size.width,
      size.height * 0.84,
    );
    path.cubicTo(
      size.width,
      size.height * 0.83,
      size.width,
      size.height * 0.83,
      size.width,
      size.height * 0.83,
    );
    path.cubicTo(
      size.width,
      size.height * 0.83,
      size.width,
      size.height * 0.82,
      size.width,
      size.height * 0.82,
    );
    path.cubicTo(
      size.width,
      size.height * 0.82,
      size.width,
      size.height * 0.82,
      size.width,
      size.height * 0.82,
    );
    path.cubicTo(
      size.width,
      size.height * 0.82,
      size.width,
      size.height * 0.82,
      size.width,
      size.height * 0.82,
    );
    path.cubicTo(
      size.width,
      size.height * 0.82,
      size.width,
      size.height * 0.8,
      size.width,
      size.height * 0.8,
    );
    path.cubicTo(
      size.width,
      size.height * 0.8,
      size.width,
      size.height * 0.8,
      size.width,
      size.height * 0.8,
    );
    path.cubicTo(
      size.width,
      size.height * 0.8,
      size.width,
      size.height * 0.8,
      size.width,
      size.height * 0.8,
    );
    path.cubicTo(
      size.width,
      size.height * 0.79,
      size.width,
      size.height * 0.79,
      size.width,
      size.height * 0.79,
    );
    path.cubicTo(
      size.width,
      size.height * 0.78,
      size.width,
      size.height * 0.78,
      size.width,
      size.height * 0.78,
    );
    path.cubicTo(
      size.width,
      size.height * 0.78,
      size.width,
      size.height * 0.77,
      size.width,
      size.height * 0.77,
    );
    path.cubicTo(
      size.width,
      size.height * 0.77,
      size.width,
      size.height * 0.76,
      size.width,
      size.height * 0.76,
    );
    path.cubicTo(
      size.width,
      size.height * 0.75,
      size.width,
      size.height * 0.74,
      size.width,
      size.height * 0.74,
    );
    path.cubicTo(
      size.width,
      size.height * 0.74,
      size.width,
      size.height * 0.74,
      size.width,
      size.height * 0.74,
    );
    path.cubicTo(
      size.width,
      size.height * 0.73,
      size.width,
      size.height * 0.73,
      size.width,
      size.height * 0.72,
    );
    path.cubicTo(
      size.width,
      size.height * 0.72,
      size.width,
      size.height * 0.71,
      size.width,
      size.height * 0.71,
    );
    path.cubicTo(
      size.width,
      size.height * 0.71,
      size.width * 0.97,
      size.height * 0.71,
      size.width * 0.97,
      size.height * 0.71,
    );
    path.cubicTo(
      size.width * 0.97,
      size.height * 0.72,
      size.width * 0.97,
      size.height * 0.71,
      size.width * 0.97,
      size.height * 0.71,
    );
    path.cubicTo(
      size.width * 0.97,
      size.height * 0.71,
      size.width * 0.96,
      size.height * 0.71,
      size.width * 0.96,
      size.height * 0.71,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.71,
      size.width * 0.96,
      size.height * 0.7,
      size.width * 0.96,
      size.height * 0.69,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.68,
      size.width * 0.96,
      size.height * 0.67,
      size.width * 0.96,
      size.height * 0.67,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.67,
      size.width * 0.96,
      size.height * 0.63,
      size.width * 0.96,
      size.height * 0.63,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.62,
      size.width * 0.96,
      size.height * 0.62,
      size.width * 0.96,
      size.height * 0.61,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.61,
      size.width * 0.96,
      size.height * 0.6,
      size.width * 0.96,
      size.height * 0.6,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.6,
      size.width * 0.96,
      size.height * 0.59,
      size.width * 0.96,
      size.height * 0.59,
    );
    path.cubicTo(
      size.width * 0.97,
      size.height * 0.59,
      size.width * 0.97,
      size.height * 0.58,
      size.width * 0.96,
      size.height * 0.57,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.57,
      size.width * 0.96,
      size.height * 0.56,
      size.width * 0.96,
      size.height * 0.56,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.56,
      size.width * 0.96,
      size.height * 0.56,
      size.width * 0.96,
      size.height * 0.55,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.55,
      size.width * 0.96,
      size.height * 0.52,
      size.width * 0.96,
      size.height * 0.52,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.51,
      size.width * 0.96,
      size.height * 0.49,
      size.width * 0.96,
      size.height * 0.49,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.49,
      size.width * 0.95,
      size.height * 0.48,
      size.width * 0.95,
      size.height * 0.48,
    );
    path.cubicTo(
      size.width * 0.95,
      size.height * 0.47,
      size.width * 0.95,
      size.height * 0.46,
      size.width * 0.95,
      size.height * 0.45,
    );
    path.cubicTo(
      size.width * 0.95,
      size.height * 0.44,
      size.width * 0.95,
      size.height * 0.44,
      size.width * 0.95,
      size.height * 0.44,
    );
    path.cubicTo(
      size.width * 0.95,
      size.height * 0.44,
      size.width * 0.95,
      size.height * 0.43,
      size.width * 0.95,
      size.height * 0.43,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.43,
      size.width * 0.96,
      size.height * 0.43,
      size.width * 0.96,
      size.height * 0.43,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.43,
      size.width * 0.96,
      size.height * 0.42,
      size.width * 0.96,
      size.height * 0.42,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.42,
      size.width * 0.97,
      size.height * 0.41,
      size.width * 0.97,
      size.height * 0.41,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.41,
      size.width * 0.98,
      size.height * 0.4,
      size.width * 0.98,
      size.height * 0.39,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.39,
      size.width * 0.98,
      size.height * 0.39,
      size.width * 0.98,
      size.height * 0.39,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.38,
      size.width * 0.98,
      size.height * 0.37,
      size.width * 0.98,
      size.height * 0.36,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.36,
      size.width * 0.98,
      size.height * 0.36,
      size.width * 0.98,
      size.height * 0.36,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.35,
      size.width * 0.98,
      size.height * 0.34,
      size.width * 0.98,
      size.height * 0.34,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.34,
      size.width * 0.98,
      size.height / 3,
      size.width * 0.98,
      size.height / 3,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.32,
      size.width * 0.98,
      size.height * 0.31,
      size.width * 0.98,
      size.height * 0.31,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.31,
      size.width * 0.98,
      size.height * 0.31,
      size.width * 0.98,
      size.height * 0.31,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.3,
      size.width * 0.98,
      size.height * 0.29,
      size.width * 0.98,
      size.height * 0.29,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.29,
      size.width * 0.98,
      size.height * 0.28,
      size.width * 0.98,
      size.height * 0.27,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.27,
      size.width,
      size.height * 0.27,
      size.width,
      size.height * 0.27,
    );
    path.cubicTo(
      size.width,
      size.height * 0.26,
      size.width,
      size.height * 0.24,
      size.width,
      size.height * 0.23,
    );
    path.cubicTo(
      size.width,
      size.height * 0.23,
      size.width * 0.98,
      size.height / 5,
      size.width * 0.98,
      size.height / 5,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height / 5,
      size.width * 0.98,
      size.height * 0.19,
      size.width * 0.98,
      size.height * 0.19,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.18,
      size.width * 0.98,
      size.height * 0.18,
      size.width * 0.98,
      size.height * 0.17,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.17,
      size.width * 0.97,
      size.height * 0.16,
      size.width * 0.97,
      size.height * 0.16,
    );
    path.cubicTo(
      size.width * 0.97,
      size.height * 0.16,
      size.width * 0.97,
      size.height * 0.14,
      size.width * 0.97,
      size.height * 0.14,
    );
    path.cubicTo(
      size.width * 0.97,
      size.height * 0.14,
      size.width * 0.97,
      size.height * 0.14,
      size.width * 0.97,
      size.height * 0.14,
    );
    path.cubicTo(
      size.width * 0.97,
      size.height * 0.14,
      size.width * 0.98,
      size.height * 0.11,
      size.width * 0.98,
      size.height * 0.11,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.11,
      size.width * 0.98,
      size.height * 0.11,
      size.width * 0.98,
      size.height * 0.11,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.11,
      size.width * 0.98,
      size.height * 0.1,
      size.width * 0.98,
      size.height * 0.1,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.09,
      size.width * 0.98,
      size.height * 0.07,
      size.width * 0.98,
      size.height * 0.07,
    );
    path.cubicTo(
      size.width * 0.97,
      size.height * 0.07,
      size.width * 0.97,
      size.height * 0.07,
      size.width * 0.97,
      size.height * 0.07,
    );
    path.cubicTo(
      size.width * 0.97,
      size.height * 0.07,
      size.width * 0.97,
      size.height * 0.05,
      size.width * 0.97,
      size.height * 0.05,
    );
    path.cubicTo(
      size.width * 0.96,
      size.height * 0.03,
      size.width * 0.95,
      size.height * 0.01,
      size.width * 0.95,
      size.height * 0.02,
    );
    path.cubicTo(
      size.width * 0.92,
      size.height * 0.02,
      size.width * 0.88,
      size.height * 0.02,
      size.width * 0.88,
      size.height * 0.02,
    );
    path.cubicTo(
      size.width * 0.88,
      size.height * 0.01,
      size.width * 0.77,
      size.height * 0.02,
      size.width * 0.76,
      size.height * 0.03,
    );
    path.cubicTo(
      size.width * 0.75,
      size.height * 0.03,
      size.width * 0.63,
      size.height * 0.01,
      size.width * 0.61,
      size.height * 0.02,
    );
    path.cubicTo(
      size.width * 0.58,
      size.height * 0.03,
      size.width * 0.44,
      size.height * 0.03,
      size.width * 0.44,
      size.height * 0.03,
    );
    path.cubicTo(
      size.width * 0.44,
      size.height * 0.03,
      size.width * 0.29,
      size.height * 0.03,
      size.width * 0.26,
      size.height * 0.03,
    );
    path.cubicTo(
      size.width * 0.26,
      size.height * 0.03,
      size.width * 0.26,
      size.height * 0.03,
      size.width / 4,
      size.height * 0.03,
    );
    path.cubicTo(
      size.width * 0.23,
      size.height * 0.03,
      size.width * 0.14,
      size.height * 0.04,
      size.width * 0.15,
      size.height * 0.05,
    );
    path.cubicTo(
      size.width * 0.16,
      size.height * 0.05,
      size.width * 0.05,
      size.height * 0.05,
      size.width * 0.04,
      size.height * 0.05,
    );
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.05,
      size.width * 0.04,
      size.height * 0.05,
      size.width * 0.04,
      size.height * 0.06,
    );
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.06,
      size.width * 0.03,
      size.height * 0.06,
      size.width * 0.03,
      size.height * 0.06,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.06,
      size.width * 0.03,
      size.height * 0.07,
      size.width * 0.03,
      size.height * 0.08,
    );
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.08,
      size.width * 0.04,
      size.height * 0.09,
      size.width * 0.03,
      size.height * 0.09,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.09,
      size.width * 0.03,
      size.height * 0.11,
      size.width * 0.03,
      size.height * 0.11,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.12,
      size.width * 0.03,
      size.height * 0.12,
      size.width * 0.03,
      size.height * 0.12,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.12,
      size.width * 0.03,
      size.height * 0.12,
      size.width * 0.03,
      size.height * 0.12,
    );
    path.cubicTo(
      size.width * 0.02,
      size.height * 0.13,
      size.width * 0.02,
      size.height * 0.13,
      size.width * 0.02,
      size.height * 0.13,
    );
    path.cubicTo(
      size.width * 0.02,
      size.height * 0.13,
      size.width * 0.01,
      size.height * 0.14,
      size.width * 0.01,
      size.height * 0.14,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.14,
      size.width * 0.01,
      size.height * 0.14,
      size.width * 0.01,
      size.height * 0.14,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.14,
      size.width * 0.01,
      size.height * 0.14,
      size.width * 0.01,
      size.height * 0.14,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.14,
      size.width * 0.01,
      size.height * 0.15,
      size.width * 0.01,
      size.height * 0.15,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.15,
      size.width * 0.01,
      size.height * 0.16,
      size.width * 0.01,
      size.height * 0.16,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.16,
      size.width * 0.01,
      size.height * 0.16,
      size.width * 0.01,
      size.height * 0.16,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.16,
      size.width * 0.01,
      size.height * 0.17,
      size.width * 0.01,
      size.height * 0.17,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.17,
      size.width * 0.01,
      size.height * 0.17,
      size.width * 0.01,
      size.height * 0.17,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.17,
      size.width * 0.01,
      size.height * 0.18,
      size.width * 0.01,
      size.height * 0.18,
    );
    path.cubicTo(
      0,
      size.height * 0.18,
      0,
      size.height * 0.18,
      0,
      size.height * 0.18,
    );
    path.cubicTo(
      0,
      size.height * 0.18,
      size.width * 0.01,
      size.height * 0.19,
      size.width * 0.01,
      size.height * 0.19,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.19,
      size.width * 0.01,
      size.height * 0.19,
      size.width * 0.01,
      size.height * 0.19,
    );
    path.cubicTo(
      0,
      size.height / 5,
      0,
      size.height / 5,
      size.width * 0.01,
      size.height / 5,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height / 5,
      size.width * 0.02,
      size.height / 5,
      size.width * 0.02,
      size.height / 5,
    );
    path.cubicTo(
      size.width * 0.02,
      size.height / 5,
      size.width * 0.02,
      size.height / 5,
      size.width * 0.02,
      size.height / 5,
    );
    path.cubicTo(
      size.width * 0.02,
      size.height / 5,
      size.width * 0.02,
      size.height / 5,
      size.width * 0.02,
      size.height / 5,
    );
    path.cubicTo(
      size.width * 0.02,
      size.height / 5,
      size.width * 0.01,
      size.height * 0.23,
      size.width * 0.01,
      size.height * 0.23,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.23,
      size.width * 0.01,
      size.height * 0.23,
      size.width * 0.01,
      size.height * 0.23,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.23,
      size.width * 0.01,
      size.height * 0.23,
      size.width * 0.01,
      size.height * 0.23,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.24,
      size.width * 0.01,
      size.height * 0.24,
      size.width * 0.01,
      size.height * 0.24,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height / 4,
      size.width * 0.01,
      size.height / 4,
      size.width * 0.01,
      size.height / 4,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height / 4,
      size.width * 0.01,
      size.height * 0.26,
      size.width * 0.01,
      size.height * 0.26,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.26,
      size.width * 0.01,
      size.height * 0.27,
      size.width * 0.01,
      size.height * 0.27,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.28,
      size.width * 0.01,
      size.height * 0.29,
      size.width * 0.01,
      size.height * 0.29,
    );
    path.cubicTo(
      size.width * 0.01,
      size.height * 0.29,
      size.width * 0.02,
      size.height * 0.29,
      size.width * 0.02,
      size.height * 0.29,
    );
    path.cubicTo(
      size.width * 0.02,
      size.height * 0.3,
      size.width * 0.02,
      size.height * 0.3,
      size.width * 0.02,
      size.height * 0.31,
    );
    path.cubicTo(
      size.width * 0.02,
      size.height * 0.31,
      size.width * 0.02,
      size.height * 0.32,
      size.width * 0.02,
      size.height * 0.32,
    );
    path.cubicTo(
      size.width * 0.02,
      size.height * 0.32,
      size.width * 0.04,
      size.height * 0.31,
      size.width * 0.04,
      size.height * 0.31,
    );
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.31,
      size.width * 0.04,
      size.height * 0.31,
      size.width * 0.04,
      size.height * 0.32,
    );
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.32,
      size.width * 0.05,
      size.height * 0.32,
      size.width * 0.05,
      size.height * 0.32,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.32,
      size.width * 0.05,
      size.height / 3,
      size.width * 0.05,
      size.height * 0.34,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.35,
      size.width * 0.05,
      size.height * 0.36,
      size.width * 0.05,
      size.height * 0.36,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.36,
      size.width * 0.05,
      size.height * 0.4,
      size.width * 0.05,
      size.height * 0.4,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.41,
      size.width * 0.05,
      size.height * 0.41,
      size.width * 0.05,
      size.height * 0.41,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.42,
      size.width * 0.05,
      size.height * 0.43,
      size.width * 0.05,
      size.height * 0.43,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.43,
      size.width * 0.05,
      size.height * 0.44,
      size.width * 0.05,
      size.height * 0.44,
    );
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.44,
      size.width * 0.04,
      size.height * 0.45,
      size.width * 0.04,
      size.height * 0.46,
    );
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.46,
      size.width * 0.05,
      size.height * 0.47,
      size.width * 0.05,
      size.height * 0.47,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.47,
      size.width * 0.05,
      size.height * 0.47,
      size.width * 0.05,
      size.height * 0.48,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.48,
      size.width * 0.05,
      size.height * 0.51,
      size.width * 0.05,
      size.height * 0.51,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.52,
      size.width * 0.05,
      size.height * 0.54,
      size.width * 0.05,
      size.height * 0.54,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.54,
      size.width * 0.06,
      size.height * 0.55,
      size.width * 0.06,
      size.height * 0.55,
    );
    path.cubicTo(
      size.width * 0.06,
      size.height * 0.56,
      size.width * 0.06,
      size.height * 0.57,
      size.width * 0.06,
      size.height * 0.58,
    );
    path.cubicTo(
      size.width * 0.06,
      size.height * 0.58,
      size.width * 0.06,
      size.height * 0.59,
      size.width * 0.06,
      size.height * 0.59,
    );
    path.cubicTo(
      size.width * 0.06,
      size.height * 0.59,
      size.width * 0.05,
      size.height * 0.6,
      size.width * 0.05,
      size.height * 0.6,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.6,
      size.width * 0.05,
      size.height * 0.6,
      size.width * 0.05,
      size.height * 0.6,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.6,
      size.width * 0.05,
      size.height * 0.61,
      size.width * 0.05,
      size.height * 0.61,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.61,
      size.width * 0.04,
      size.height * 0.62,
      size.width * 0.04,
      size.height * 0.62,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.62,
      size.width * 0.03,
      size.height * 0.63,
      size.width * 0.03,
      size.height * 0.64,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.64,
      size.width * 0.03,
      size.height * 0.64,
      size.width * 0.03,
      size.height * 0.64,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.65,
      size.width * 0.03,
      size.height * 0.66,
      size.width * 0.03,
      size.height * 0.67,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.67,
      size.width * 0.03,
      size.height * 0.67,
      size.width * 0.03,
      size.height * 0.67,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.68,
      size.width * 0.03,
      size.height * 0.69,
      size.width * 0.03,
      size.height * 0.69,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.69,
      size.width * 0.03,
      size.height * 0.7,
      size.width * 0.03,
      size.height * 0.7,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.71,
      size.width * 0.03,
      size.height * 0.72,
      size.width * 0.03,
      size.height * 0.72,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.72,
      size.width * 0.03,
      size.height * 0.72,
      size.width * 0.03,
      size.height * 0.72,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.73,
      size.width * 0.03,
      size.height * 0.74,
      size.width * 0.03,
      size.height * 0.74,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.74,
      size.width * 0.03,
      size.height * 0.75,
      size.width * 0.03,
      size.height * 0.75,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.75,
      size.width * 0.02,
      size.height * 0.76,
      size.width * 0.02,
      size.height * 0.76,
    );
    path.cubicTo(
      size.width * 0.02,
      size.height * 0.77,
      size.width * 0.02,
      size.height * 0.79,
      size.width * 0.02,
      size.height * 0.8,
    );
    path.cubicTo(
      size.width * 0.02,
      size.height * 0.8,
      size.width * 0.03,
      size.height * 0.82,
      size.width * 0.03,
      size.height * 0.82,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.83,
      size.width * 0.03,
      size.height * 0.83,
      size.width * 0.03,
      size.height * 0.84,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.85,
      size.width * 0.03,
      size.height * 0.85,
      size.width * 0.03,
      size.height * 0.86,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.86,
      size.width * 0.04,
      size.height * 0.87,
      size.width * 0.04,
      size.height * 0.87,
    );
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.87,
      size.width * 0.04,
      size.height * 0.89,
      size.width * 0.04,
      size.height * 0.89,
    );
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.89,
      size.width * 0.04,
      size.height * 0.89,
      size.width * 0.04,
      size.height * 0.89,
    );
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.89,
      size.width * 0.03,
      size.height * 0.92,
      size.width * 0.03,
      size.height * 0.92,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.92,
      size.width * 0.03,
      size.height * 0.92,
      size.width * 0.03,
      size.height * 0.92,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.92,
      size.width * 0.03,
      size.height * 0.93,
      size.width * 0.03,
      size.height * 0.93,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.94,
      size.width * 0.03,
      size.height * 0.95,
      size.width * 0.03,
      size.height * 0.96,
    );
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.96,
      size.width * 0.03,
      size.height * 0.96,
      size.width * 0.04,
      size.height * 0.96,
    );
    path.cubicTo(
      size.width * 0.04,
      size.height * 0.96,
      size.width * 0.04,
      size.height * 0.96,
      size.width * 0.04,
      size.height * 0.96,
    );
    path.close();
    return path;
  }
}
