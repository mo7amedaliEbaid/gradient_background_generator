import 'package:flutter/material.dart';
import 'package:gradient_background_generator/gradient_background_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .25,
              child: const AnimatedGradientBackground(
                angle: 0.4,
                style: GradientStyle.linear,
                colorSets: [GradientPreset.levi, GradientPreset.azureLane],
                duration: Duration(seconds: 2),
                direction: GradientDirection.leftToRight,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .25,
              child: const GradientBackground(
                angle: 1,
                style: GradientStyle.sweep,
                colors: GradientPreset.boogieWonderland,
                direction: GradientDirection.leftToRight,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .25,
              child: const GradientBackground(
                style: GradientStyle.radial,
                colors: GradientPreset.diesel,
                direction: GradientDirection.leftToRight,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .25,
              child: const AnimatedGradientBackground(
                angle: 0.9,
                style: GradientStyle.sweep,
                colorSets: [
                  GradientPreset.diesel,
                  GradientPreset.frozen,
                ],
                duration: Duration(seconds: 2),
                direction: GradientDirection.rightToLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
