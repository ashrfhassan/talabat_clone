import 'package:flutter/material.dart';

class WavyAppBarShape extends ContinuousRectangleBorder {
  const WavyAppBarShape({super.side});

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // Adjust these values to control the wave's appearance.
    const double waveHeight = 6.0;
    const int waveCount = 3; // Number of waves along the width.
    final double waveWidth = rect.width / waveCount;

    final Path path = Path();
    // Start at top left.
    path.moveTo(rect.left, rect.top);
    // Draw top edge.
    path.lineTo(rect.right, rect.top);
    // Right edge.
    path.lineTo(rect.right, rect.bottom - waveHeight);

    // Draw the wavy bottom edge.
    for (int i = 0; i < waveCount; i++) {
      // Starting point for each wave segment.
      final double startX = rect.right - (i * waveWidth);
      final double midX = startX - (waveWidth / 2);
      final double endX = startX - waveWidth;
      // Alternate control points to create the wave.
      final double controlY = (i % 2 == 0) ? rect.bottom + waveHeight : rect.bottom - 3 * waveHeight;
      path.quadraticBezierTo(midX, controlY, endX, rect.bottom - waveHeight);
    }

    // Left edge.
    path.lineTo(rect.left, rect.bottom - waveHeight);
    // Close the shape.
    path.lineTo(rect.left, rect.top);
    path.close();

    return path;
  }
}
