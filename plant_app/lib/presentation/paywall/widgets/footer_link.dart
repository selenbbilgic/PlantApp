import 'package:flutter/material.dart';

/// A tappable footer link
class FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const FooterLink({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Text(
      label,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Colors.white.withAlpha(150),
        fontWeight: FontWeight.w400,
        fontSize: 11,
      ),
    ),
  );
}
