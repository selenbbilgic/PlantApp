part of '../home_view.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner();

  @override
  Widget build(BuildContext context) {
    final titleGradient = const LinearGradient(
      colors: [Color(0xFFF0D399), Color(0xFFD9A846)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final subtitleGradient = const LinearGradient(
      colors: [Color(0xFFD9A846), Color(0xFFF0D399)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Card(
      //margin: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(horizontal: 14),
      color: Theme.of(context).colorScheme.onInverseSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          context.router.push(PaywallViewRoute());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Row(
            children: [
              SvgPicture.asset(GOLDEN_MESSAGE_ICON, width: 40),
              const SizedBox(width: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    'FREE Premium Available',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    gradient: titleGradient,
                  ),
                  SizedBox(height: 4),
                  GradientText(
                    'Tap to upgrade your account!',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    gradient: subtitleGradient,
                  ),
                ],
              ),

              const Spacer(),

              // trailing icon
              Icon(Icons.chevron_right, color: Colors.amberAccent, size: 32),
            ],
          ),
        ),
      ),
    );
  }
}
