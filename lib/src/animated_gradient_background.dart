import 'package:flutter/material.dart';

import '../gradient_background_generator.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final List<List<Color>> colorSets;
  final Duration duration;
  final double angle;
  final GradientStyle style;
  final GradientDirection direction;

  const AnimatedGradientBackground({
    super.key,
    required this.colorSets,
    this.duration = const Duration(seconds: 3),
    this.angle = 0.0,
    this.style = GradientStyle.linear,
    this.direction = GradientDirection.leftToRight,
  });

  @override
  AnimatedGradientBackgroundState createState() =>
      AnimatedGradientBackgroundState();
}

class AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat(reverse: true);
    _colorTween = ColorTween(
      begin: widget.colorSets.first.first,
      end: widget.colorSets.first.last,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return GradientBackground(
          colors: [
            _colorTween.value ?? widget.colorSets.first.first,
            widget.colorSets.last.last
          ],
          angle: widget.angle,
          style: widget.style,
          direction: widget.direction,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
