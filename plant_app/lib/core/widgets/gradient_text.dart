import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;
  final TextAlign? textAlign;
  const GradientText(
    this.text, {
    super.key,
    required this.style,
    required this.gradient,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback:
          (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
      blendMode: BlendMode.srcIn,
      child: Text(text, style: style, textAlign: textAlign),
    );
  }
}
