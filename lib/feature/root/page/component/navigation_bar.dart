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
      onDestinationSelected: tabsRouter.setActiveIndexX,
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

extension on TabsRouter {
  /// 拡張したsetActiveIndex()
  ///
  /// 現在選択中のタブを再度押下した場合スタックを破棄して最初の画面に戻す
  void setActiveIndexX(int index, {bool notify = true}) {
    if (activeIndex == index) {
      final currentRouteName = current.name;
      final currentRoute = innerRouterOf<StackRouter>(currentRouteName);
      currentRoute?.popUntilRoot();
    }
    setActiveIndex(index, notify: notify);
  }
}
