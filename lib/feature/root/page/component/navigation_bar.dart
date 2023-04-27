import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../state/navigation_item.dart';

class RootNavigationBar extends StatelessWidget {
  const RootNavigationBar({
    super.key,
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
