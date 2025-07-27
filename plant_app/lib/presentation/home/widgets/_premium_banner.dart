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
      margin: EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).colorScheme.onInverseSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          /* upgrade action */
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.email, size: 32, color: Colors.amberAccent),
              const SizedBox(width: 16),

              // ← HERE: gradient text
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
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    gradient: subtitleGradient,
                  ),
                ],
              ),

              const Spacer(),

              // trailing icon
              Icon(Icons.chevron_right, color: Colors.amberAccent, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
