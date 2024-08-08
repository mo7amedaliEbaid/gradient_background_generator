import 'dart:ui';

import 'package:flutter/material.dart';

import '../gradient_background_generator.dart';

class GradientBackground extends StatelessWidget {
  final List<Color> colors;
  final double angle;
  final GradientStyle style;
  final GradientDirection direction;
  final double opacity;
  final double blur;

  const GradientBackground({
    super.key,
    this.colors = const [Colors.blue, Colors.purple],
    this.angle = 0.0,
    this.style = GradientStyle.linear,
    this.direction = GradientDirection.leftToRight,
    this.opacity = 1.0,
    this.blur = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: GradientUtil.createGradient(
          colors,
          angle,
          style,
          direction,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),
        child: Container(
          color: Colors.black.withOpacity(1.0 - opacity),
        ),
      ),
    );
  }
}
