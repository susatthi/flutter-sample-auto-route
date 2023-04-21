import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router.dart';

enum NavigationItem {
  dashboard(
    label: 'ダッシュボード',
    icon: Icons.dashboard_outlined,
    selectedIcon: Icons.dashboard,
  ),
  settings(
    label: '設定',
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings,
  ),
  ;

  const NavigationItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;

  static NavigationItem indexOf(int index) => NavigationItem.values[index];
}

@RoutePage()
class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashboardRoute(),
        SettingsRouterRoute(),
      ],
      transitionBuilder: (context, child, animation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, _) => child,
        );
      },
      builder: (context, child) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          body: child,
          bottomNavigationBar: _NavigationBar(tabsRouter: tabsRouter),
        );
      },
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    required this.tabsRouter,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: tabsRouter.activeIndex,
      destinations: NavigationItem.values
          .map((item) => _NavigationDestination(item: item))
          .toList(),
      onDestinationSelected: tabsRouter.setActiveIndex,
    );
  }
}

class _NavigationDestination extends StatelessWidget {
  const _NavigationDestination({
    required this.item,
  });

  final NavigationItem item;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(item.icon),
      selectedIcon: Icon(item.selectedIcon),
      label: item.label,
    );
  }
}
