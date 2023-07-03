import 'package:flutter/material.dart';
import 'package:nuri/ui/widget/bottom_nav/nuri_bottomnavigation_constants.dart';

class NuriBottomNavigatorBar extends StatefulWidget {
  NuriBottomNavigatorBar({super.key, required this.onTap, required this.currentPageIndex});
  int currentPageIndex = 0;
  void Function(int) onTap;

  @override
  State<NuriBottomNavigatorBar> createState() => _NuriBottomNavigatorBarState();
}

class _NuriBottomNavigatorBarState extends State<NuriBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: options,
      currentIndex: widget.currentPageIndex,
      onTap: widget.onTap,
    );
  }
}
