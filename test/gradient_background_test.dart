import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_background_generator/gradient_background_generator.dart';

void main() {
  group('GradientBackground Widget Tests', () {
    testWidgets('renders with default gradient', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientBackground(),
          ),
        ),
      );

      final container = find
          .descendant(
            of: find.byType(GradientBackground),
            matching: find.byType(Container),
          )
          .evaluate()
          .first
          .widget as Container;

      final decoration = container.decoration as BoxDecoration;
      final gradient = decoration.gradient as LinearGradient;

      expect(gradient.colors, [Colors.blue, Colors.purple]);
      expect(gradient.begin, Alignment.centerLeft);
      expect(gradient.end, Alignment.centerRight);
    });

    testWidgets('applies custom colors and direction',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientBackground(
              colors: [Colors.green, Colors.yellow],
              direction: GradientDirection.topToBottom,
            ),
          ),
        ),
      );

      final container = find
          .descendant(
            of: find.byType(GradientBackground),
            matching: find.byType(Container),
          )
          .evaluate()
          .first
          .widget as Container;

      final decoration = container.decoration as BoxDecoration;
      final gradient = decoration.gradient as LinearGradient;

      expect(gradient.colors, [Colors.green, Colors.yellow]);
      expect(gradient.begin, Alignment.topCenter);
      expect(gradient.end, Alignment.bottomCenter);
    });

    testWidgets('applies blur effect', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientBackground(
              blur: 5.0,
            ),
          ),
        ),
      );

      final backdropFilter =
          tester.widget<BackdropFilter>(find.byType(BackdropFilter));
      expect(backdropFilter.filter, isNotNull);

      final imageFilter = backdropFilter.filter as ImageFilter;
      expect(imageFilter.toString(), contains('blur'));
    });

    testWidgets('applies opacity', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientBackground(
              opacity: 0.5,
            ),
          ),
        ),
      );

      final container = find
          .descendant(
            of: find.byType(GradientBackground),
            matching: find.byType(Container),
          )
          .evaluate()
          .last
          .widget as Container;

      expect(container.color, Colors.black.withOpacity(0.5));
    });
  });
}
