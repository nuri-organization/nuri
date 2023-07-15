import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/ui/screen/chat/chat_screen.dart';
import 'package:nuri/ui/screen/profile/profile_screen.dart';
import 'package:nuri/ui/screen/shortory/shortory_screen.dart';
import 'package:nuri/ui/screen/travel/travel_screen.dart';
import 'package:nuri/ui/widget/bottom_nav/bottomnav_router.dart';
import 'package:nuri/ui/widget/bottom_nav/navigation_cubit.dart';
import 'package:nuri/ui/widget/bottom_nav/nuri_bottomnavigation_constants.dart';

import 'ui/widget/bottom_nav/bottomnav_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state){
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            items: options,
            onTap: (index){
              BlocProvider.of<NavigationCubit>(context).getNavBarItem(index);
            },
          );
        },
      ),
      body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state){
                return bottomNavRouter.elementAt(state.index);
              },
            )
          )
      ),
    );
  }
}
