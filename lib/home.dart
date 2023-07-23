import 'package:flutter/material.dart';
import 'package:nuri/config/scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(isInBottomNavigation: true,);
  }
}
