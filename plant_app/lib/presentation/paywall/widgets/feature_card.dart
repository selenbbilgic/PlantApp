import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A little card showing an icon + title + subtitle.
class FeatureCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  const FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(20),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.inverseSurface.withAlpha(180),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(icon, width: 18, height: 18),
          ),
          const Spacer(),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
