import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;

  final double size;

  final double borderWidth;

  final double dotSize;

  const CustomRadio({
    Key? key,
    required this.selected,
    required this.onTap,
    this.size = 28,
    this.borderWidth = 3,
    this.dotSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color activeColor = Theme.of(context).colorScheme.primary;
    final Color inactiveColor = Theme.of(
      context,
    ).colorScheme.surface.withAlpha(18);
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: selected ? activeColor : inactiveColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? activeColor : Colors.transparent,
          ),
        ),
        child:
            selected
                ? Center(
                  child: Container(
                    width: dotSize,
                    height: dotSize,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
                : null,
      ),
    );
  }
}
