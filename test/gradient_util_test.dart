import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_background_generator/gradient_background_generator.dart';

void main() {
  group('GradientUtil Tests', () {
    test('creates linear gradient with correct colors and angle', () {
      final gradient = GradientUtil.createGradient(
        [Colors.red, Colors.blue],
        0.5,
        GradientStyle.linear,
        GradientDirection.leftToRight,
      );

      expect(gradient, isA<LinearGradient>());
      final linearGradient = gradient as LinearGradient;
      expect(linearGradient.colors, [Colors.red, Colors.blue]);
      expect(linearGradient.begin, Alignment.centerLeft);
      expect(linearGradient.end, Alignment.centerRight);
      expect(linearGradient.transform, isA<GradientRotation>());
    });

    test('creates radial gradient with correct colors', () {
      final gradient = GradientUtil.createGradient(
        [Colors.red, Colors.blue],
        0.0,
        GradientStyle.radial,
        GradientDirection.leftToRight,
      );

      expect(gradient, isA<RadialGradient>());
      final radialGradient = gradient as RadialGradient;
      expect(radialGradient.colors, [Colors.red, Colors.blue]);
    });

    test('creates sweep gradient with correct colors and angle', () {
      final gradient = GradientUtil.createGradient(
        [Colors.red, Colors.blue],
        3.141592653589793, // 180 degrees
        GradientStyle.sweep,
        GradientDirection.leftToRight,
      );

      expect(gradient, isA<SweepGradient>());
      final sweepGradient = gradient as SweepGradient;
      expect(sweepGradient.colors, [Colors.red, Colors.blue]);
      expect(sweepGradient.startAngle, 0.0);
      expect(sweepGradient.endAngle, 3.141592653589793);
    });

    test('applies correct direction for linear gradient', () {
      final gradient = GradientUtil.createGradient(
        [Colors.red, Colors.blue],
        0.0,
        GradientStyle.linear,
        GradientDirection.topToBottom,
      );

      expect(gradient, isA<LinearGradient>());
      final linearGradient = gradient as LinearGradient;
      expect(linearGradient.begin, Alignment.topCenter);
      expect(linearGradient.end, Alignment.bottomCenter);
    });
  });
}
