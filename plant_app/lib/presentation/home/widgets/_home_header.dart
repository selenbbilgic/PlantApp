part of '../home_view.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader();

  @override
  Widget build(BuildContext context) {
    // how tall *below* the status‑bar we want the header
    const contentHeight = 175.0;

    // system padding at top (status bar)
    final topPadding = MediaQuery.of(context).padding.top;

    return SizedBox(
      // combine status‑bar + content
      height: topPadding + contentHeight,
      width: double.infinity,
      child: Stack(
        children: [
          // 1) full‑screen background (goes under status bar)
          Positioned.fill(
            child: Image.asset(
              HOME_BACKGROUND,
              fit: BoxFit.cover, // cover the entire area
            ),
          ),

          // 2) the “safe” content on top
          Positioned(
            top: topPadding,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, plant lover!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        _greeting(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.wb_sunny, color: Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // 3) search bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for plants',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surface,

                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 16,
                      ),
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

  String _greeting() {
    final hour = TimeOfDay.now().hour;
    if (hour < 12) return 'Good Morning!';
    if (hour < 17) return 'Good Afternoon!';
    return 'Good Evening!';
  }
}
