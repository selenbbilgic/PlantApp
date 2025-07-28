// lib/presentation/paywall/paywall_view.dart

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/core/constants/icons.dart';
import 'package:plant_app/core/constants/images.dart';
import 'package:plant_app/core/widgets/primary_button.dart';
import 'package:plant_app/data/models/premium_feature.dart';
import 'package:plant_app/presentation/paywall/widgets/feature_card.dart';
import 'package:plant_app/presentation/paywall/widgets/footer_link.dart';
import 'package:plant_app/presentation/paywall/widgets/subscription_option_card.dart';

@RoutePage()
class PaywallView extends StatefulWidget {
  const PaywallView({super.key});

  @override
  State<PaywallView> createState() => _PaywallViewState();
}

class _PaywallViewState extends State<PaywallView> {
  int _selectedOption = 1;

  List<PremiumFeature> features = [
    PremiumFeature(
      svgAsset: SCANNER_ICON,
      title: 'Unlimited',
      subtitle: 'Plant Identify',
    ),
    PremiumFeature(
      svgAsset: SPEEDOMETER_ICON,
      title: 'Faster',
      subtitle: 'Processing',
    ),
    PremiumFeature(
      svgAsset: SPEEDOMETER_ICON,
      title: 'Regular',
      subtitle: 'Updates',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Make the status bar transparent so our image can bleed under it.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

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
                  Spacer(),
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
                          child: FeatureCard(
                            icon: f.svgAsset,
                            title: f.title,
                            subtitle: f.subtitle,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 3e) Subscription options
                  SubscriptionOption(
                    title: '1 Month',
                    price: '\$2.99/month, auto renewable',
                    selected: _selectedOption == 0,
                    onTap: () => setState(() => _selectedOption = 0),
                  ),
                  const SizedBox(height: 16),
                  SubscriptionOption(
                    title: '1 Year',
                    price: 'First 3 days free, then \$529.99/year',
                    selected: _selectedOption == 1,
                    badge: 'Save 50%',
                    onTap: () => setState(() => _selectedOption = 1),
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
                        FooterLink(label: 'Terms', onTap: () {}),
                        const Text(
                          '·',
                          style: TextStyle(color: Colors.white54),
                        ),
                        FooterLink(label: 'Privacy', onTap: () {}),
                        const Text(
                          '·',
                          style: TextStyle(color: Colors.white54),
                        ),
                        FooterLink(label: 'Restore', onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 3) your close button, absolutely positioned
          Positioned(
            top: MediaQuery.of(context).padding.top + 6,
            right: 16,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.black45,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 16,
                iconSize: 20,
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
                tooltip: 'Close',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
