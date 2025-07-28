import 'package:flutter/material.dart';
import 'package:plant_app/core/widgets/custom_raido_button.dart';

/// A subscription row with a radio, text, and optional badge.
class SubscriptionOption extends StatelessWidget {
  final String title;
  final String price;
  final bool selected;
  final String? badge;
  final VoidCallback onTap;

  const SubscriptionOption({
    required this.title,
    required this.price,
    required this.selected,
    this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor =
        selected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary.withAlpha(120);
    final bgColor =
        selected
            ? Theme.of(context).colorScheme.primary.withAlpha(10)
            : Colors.transparent;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(color: borderColor, width: selected ? 2 : 0.5),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
            child: Row(
              children: [
                CustomRadio(
                  selected: selected,
                  onTap: onTap,
                  size: 24,
                  borderWidth: 0,
                  dotSize: 8,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall?.copyWith(color: Colors.white),
                      ),
                      Text(
                        price,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (badge != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF28AF6E),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(14),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Text(
                  badge!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
