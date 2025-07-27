part of '../home_view.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader();

  @override
  Widget build(BuildContext context) {
    final hour = TimeOfDay.now().hour;
    final greeting =
        hour < 12
            ? 'Good Morning'
            : hour < 17
            ? 'Good Afternoon'
            : 'Good Evening';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hi, plant lover!', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              greeting + '!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(width: 8),
            const Icon(Icons.wb_sunny, color: Colors.amber),
          ],
        ),
      ],
    );
  }
}
