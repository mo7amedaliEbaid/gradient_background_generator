/*void main() {
  group('AnimatedGradientBackground Widget Tests', () {
    testWidgets('renders with initial gradient', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedGradientBackground(
              colorSets: [
                [Colors.red, Colors.blue],
                [Colors.green, Colors.yellow],
              ],
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

      expect(gradient.colors, [Colors.red, Colors.blue]);
    });

    testWidgets('animates between colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedGradientBackground(
              colorSets: [
                [Colors.red, Colors.blue],
                [Colors.green, Colors.yellow],
              ],
              duration: const Duration(seconds: 1),
            ),
          ),
        ),
      );

      // Start the animation
      await tester.pump();
      final initialContainer = find
          .descendant(
            of: find.byType(GradientBackground),
            matching: find.byType(Container),
          )
          .evaluate()
          .first
          .widget as Container;
      final initialDecoration = initialContainer.decoration as BoxDecoration;
      final initialGradient = initialDecoration.gradient as LinearGradient;
      expect(initialGradient.colors, [Colors.red, Colors.blue]);

      // Move forward in time
      await tester.pump(const Duration(milliseconds: 500));
      final midContainer = find
          .descendant(
            of: find.byType(GradientBackground),
            matching: find.byType(Container),
          )
          .evaluate()
          .first
          .widget as Container;
      final midDecoration = midContainer.decoration as BoxDecoration;
      final midGradient = midDecoration.gradient as LinearGradient;

      // Check that the color has changed
      expect(midGradient.colors.first, isNot(equals(Colors.red)));
      expect(midGradient.colors.last, isNot(equals(Colors.blue)));

      // Complete the animation
      await tester.pump(const Duration(milliseconds: 500));
      final finalContainer = find
          .descendant(
            of: find.byType(GradientBackground),
            matching: find.byType(Container),
          )
          .evaluate()
          .first
          .widget as Container;
      final finalDecoration = finalContainer.decoration as BoxDecoration;
      final finalGradient = finalDecoration.gradient as LinearGradient;
      expect(finalGradient.colors, [Colors.green, Colors.yellow]);
    });

    testWidgets('uses correct gradient style and direction',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedGradientBackground(
              colorSets: [
                [Colors.red, Colors.blue],
                [Colors.green, Colors.yellow],
              ],
              style: GradientStyle.radial,
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
      final gradient = decoration.gradient as RadialGradient;

      expect(gradient.colors, [Colors.red, Colors.blue]);
    });
  });
}*/
