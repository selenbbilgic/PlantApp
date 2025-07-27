// lib/presentation/paywall/paywall_view.dart

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_app/core/constants/images.dart';
import 'package:plant_app/core/widgets/primary_button.dart';
import 'package:plant_app/data/models/premium_feature.dart';

@RoutePage()
class PaywallView extends StatelessWidget {
  const PaywallView({super.key});

  @override
  Widget build(BuildContext context) {
    // Make the status bar transparent so our image can bleed under it.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    const List<PremiumFeature> features = [
      PremiumFeature(
        icon: Icons.crop_free,
        title: 'Unlimited',
        subtitle: 'Plant Identify',
      ),
      PremiumFeature(
        icon: Icons.speed,
        title: 'Faster',
        subtitle: 'Processing',
      ),
      PremiumFeature(icon: Icons.update, title: 'Regular', subtitle: 'Updates'),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      extendBodyBehindAppBar: true,
      // No AppBar—you’ll handle the close button manually
      body: Stack(
        children: [
          // 1) Full‑screen background image
          Positioned(
            left: 0,
            right: 0,
            child: Image.asset(
              PAYWALL_IMAGE, // your forest image
              fit: BoxFit.cover,
            ),
          ),

          // 3) Main content, padded into the safe area
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 3a) Close button
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),

                  const SizedBox(height: 108),

                  // 3b) Title: “PlantApp Premium”
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'PlantApp',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        TextSpan(
                          text: ' Premium',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(color: Colors.white, fontSize: 32),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 4),

                  // 3c) Subtitle
                  Text(
                    'Access All Features',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.white70),
                  ),

                  const SizedBox(height: 24),

                  // 3d) Two feature cards
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.34,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: features.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, idx) {
                        final f = features[idx];
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: _FeatureCard(
                            icon: f.icon,
                            title: f.title,
                            subtitle: f.subtitle,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 3e) Subscription options
                  _SubscriptionOption(
                    title: '1 Month',
                    price: '\$2.99/month, auto renewable',
                    selected: false,
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  _SubscriptionOption(
                    title: '1 Year',
                    price: 'First 3 days free, then \$529.99/year',
                    selected: true,
                    badge: 'Save 50%',
                    onTap: () {},
                  ),

                  const SizedBox(height: 32),

                  // 3f) Primary action button
                  PrimaryButton(
                    label: 'Try free for 3 days',
                    onPressed: () => null,
                  ),

                  const SizedBox(height: 10),

                  // 3g) Footnote
                  Text(
                    'After the 3‑day free trial period you’ll be charged €274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto‑Renewable.',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.white54),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 10),

                  // 3h) Terms · Privacy · Restore
                  Center(
                    child: Wrap(
                      spacing: 8,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        _FooterLink(label: 'Terms', onTap: () {}),
                        const Text(
                          '·',
                          style: TextStyle(color: Colors.white54),
                        ),
                        _FooterLink(label: 'Privacy', onTap: () {}),
                        const Text(
                          '·',
                          style: TextStyle(color: Colors.white54),
                        ),
                        _FooterLink(label: 'Restore', onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A little card showing an icon + title + subtitle.
class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _FeatureCard({
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
          Icon(icon, size: 28, color: Colors.white),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

/// A subscription row with a radio, text, and optional badge.
class _SubscriptionOption extends StatelessWidget {
  final String title;
  final String price;
  final bool selected;
  final String? badge;
  final VoidCallback onTap;

  const _SubscriptionOption({
    required this.title,
    required this.price,
    required this.selected,
    this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor =
        selected ? const Color(0xFF28AF6E) : Colors.grey.shade700;
    final bgColor = selected ? Colors.green.withAlpha(10) : Colors.transparent;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: borderColor,
            width: selected ? 2 : 0.5,
            strokeAlign: 1.5,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: selected,
              onChanged: (_) => onTap(),
              activeColor: const Color(0xFF28AF6E),
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
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            if (badge != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF28AF6E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badge!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A tappable footer link
class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _FooterLink({required this.label, required this.onTap});

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
