import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/core/constants/icons.dart';
import 'package:plant_app/presentation/diagnose/diagnose_view.dart';
import 'package:plant_app/presentation/garden/garden_view.dart';
import 'package:plant_app/presentation/home/home_view.dart';
import 'package:plant_app/presentation/onboarding/onboarding_page_1.dart';
import 'package:plant_app/presentation/onboarding/onboarding_page_2.dart';
import 'package:plant_app/presentation/profile/profile_view.dart';
import 'package:plant_app/presentation/scanner/scan_view.dart';

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
    DiagnoseView(),
    ScanView(),
    GardenView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(index: selectedIndex, children: _screens),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (i) => setState(() => selectedIndex = i),
        showUnselectedLabels: true,
        selectedLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
        unselectedLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              HOME_ICON,
              width: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              HOME_ICON,
              width: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(HEALTHCARE_ICON, width: 24),
            activeIcon: SvgPicture.asset(
              HEALTHCARE_ICON,
              width: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
            label: 'Diagnose',
          ),
          // placeholder for the FAB slot
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(GARDEN_ICON, width: 24),
            activeIcon: SvgPicture.asset(
              GARDEN_ICON,
              width: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
            label: 'My Garden',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(PROFILE_ICON, width: 24),
            activeIcon: SvgPicture.asset(
              PROFILE_ICON,
              width: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(),
        onPressed: () => _onItemTapped(2),
        child: SvgPicture.asset(
          width: 26,
          SCANNER_ICON,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
