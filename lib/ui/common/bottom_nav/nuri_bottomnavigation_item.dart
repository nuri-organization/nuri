import 'package:flutter/material.dart';

class NuriBottomNavigationItem extends BottomNavigationBarItem {
  const NuriBottomNavigationItem({
    required this.initialLocation,
    required Widget icon,
    String? label
}):super(icon: icon, label: label);
  final String initialLocation;
}
