import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/ui/widget/bottom_nav/bottomnav_router.dart';
import 'package:nuri/ui/widget/bottom_nav/bottomnav_state.dart';
import 'package:nuri/ui/widget/bottom_nav/navigation_cubit.dart';
import 'package:nuri/ui/widget/bottom_nav/nuri_bottomnavigation_constants.dart';

class NuriScaffold extends StatelessWidget {
  NuriScaffold({super.key, this.isInBottomNavigation = false, required this.child, this.title = "누리"});
  bool isInBottomNavigation;
  Widget child;
  String? title;

  @override
  Widget build(BuildContext context) {
    if(isInBottomNavigation){
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
    return Scaffold(
      appBar: AppBar(title: Text(title!),),
      body:SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
                child: child
          )
      ),
    );
  }
}
