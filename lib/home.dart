import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/ui/widget/bottom_nav/bottom_navigation_router.dart';
import 'package:nuri/ui/widget/bottom_nav/bottom_navigator_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTapActionBottomNavigation(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: NuriBottomNavigatorBar(
        onTap: _onTapActionBottomNavigation,
        currentPageIndex: _currentIndex,
      ),
      body: widgetOptions.elementAt(_currentIndex),
    );
  }
}
