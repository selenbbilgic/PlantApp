import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plant_app/presentation/home/home_view.dart';
import 'package:plant_app/presentation/onboarding/onboarding_page_1.dart';
import 'package:plant_app/presentation/onboarding/onboarding_page_2.dart';

@RoutePage()
class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});
  @override
  State<BottomNavBarView> createState() => BottomNavBarViewState();
}

class BottomNavBarViewState extends State<BottomNavBarView> {
  int selectedIndex = 0;

  final List<Widget> _screens = [
    HomeView(),
    OnboardingPage1(),
    OnboardingPage1(),
    OnboardingPage1(),
    OnboardingPage1(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(index: selectedIndex, children: _screens),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        // Add a 1px top border:
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Theme.of(context).colorScheme.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavIcon(Icons.home, 0, context),
              _buildNavIcon(Icons.favorite, 1, context),
              const SizedBox(width: 48), // Space for FAB
              _buildNavIcon(Icons.person, 3, context),
              _buildNavIcon(Icons.settings, 4, context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor:
            Theme.of(context).colorScheme.primary, // Customize as needed
        shape: const CircleBorder(),
        onPressed: () => _onItemTapped(2), // Tap to select Favorites
        child: const Icon(size: 40, Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavIcon(IconData icon, int index, BuildContext ctx) {
    final isSelected = selectedIndex == index;
    final color =
        isSelected
            ? Theme.of(ctx).colorScheme.primary
            : Theme.of(ctx).colorScheme.secondary;
    return IconButton(
      icon: Icon(icon, size: 30, color: color),
      onPressed: () => _onItemTapped(index),
    );
  }
}
