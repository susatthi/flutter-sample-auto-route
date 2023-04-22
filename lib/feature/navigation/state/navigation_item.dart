import 'package:flutter/material.dart';

enum NavigationItem {
  home(
    label: 'ホーム',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
  ),
  mypage(
    label: 'マイページ',
    icon: Icons.account_circle_outlined,
    selectedIcon: Icons.account_circle,
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
