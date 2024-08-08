import 'package:flutter/material.dart';

enum GradientStyle { linear, radial, sweep }

enum GradientDirection {
  topToBottom,
  bottomToTop,
  leftToRight,
  rightToLeft,
  diagonal,
}

class GradientUtil {
  static Gradient createGradient(List<Color> colors, double angle,
      GradientStyle style, GradientDirection direction) {
    Alignment begin;
    Alignment end;

    switch (direction) {
      case GradientDirection.topToBottom:
        begin = Alignment.topCenter;
        end = Alignment.bottomCenter;
        break;
      case GradientDirection.bottomToTop:
        begin = Alignment.bottomCenter;
        end = Alignment.topCenter;
        break;
      case GradientDirection.leftToRight:
        begin = Alignment.centerLeft;
        end = Alignment.centerRight;
        break;
      case GradientDirection.rightToLeft:
        begin = Alignment.centerRight;
        end = Alignment.centerLeft;
        break;
      case GradientDirection.diagonal:
        begin = Alignment.topLeft;
        end = Alignment.bottomRight;
        break;
      default:
        begin = Alignment.centerLeft;
        end = Alignment.centerRight;
    }

    switch (style) {
      case GradientStyle.linear:
        return LinearGradient(
          colors: colors,
          begin: begin,
          end: end,
          transform: GradientRotation(angle),
        );
      case GradientStyle.radial:
        return RadialGradient(colors: colors);
      case GradientStyle.sweep:
        return SweepGradient(
          colors: colors,
          startAngle: 0.0,
          endAngle: angle,
        );
      default:
        return LinearGradient(colors: colors);
    }
  }
}
