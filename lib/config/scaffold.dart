import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/ui/screen/shortory/shortory_post_screen.dart';
import 'package:nuri/ui/screen/travel/travel_post_screen.dart';
import 'package:nuri/ui/widget/action_button.dart';
import 'package:nuri/ui/widget/bottom_nav/bottomnav_router.dart';
import 'package:nuri/ui/widget/bottom_nav/bottomnav_state.dart';
import 'package:nuri/ui/widget/bottom_nav/navigation_cubit.dart';
import 'package:nuri/ui/widget/bottom_nav/nuri_bottomnavigation_constants.dart';

class NuriScaffold extends StatelessWidget {
  NuriScaffold({super.key, this.isInBottomNavigation = false, this.child, this.title = "누리", this.isInAppbar = true});
  bool isInBottomNavigation;
  Widget? child;
  String? title;
  bool isInAppbar;

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
        floatingActionButton: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state){
            if(state.index == 0){
             return ActionButton(children: [
               ActionButtonSetting(
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ShortoryPostScreen()));
                   },
                   icon: const Icon(Icons.add)
               )
             ],);
            }
            if(state.index == 1){
              return ActionButton(children: [
                ActionButtonSetting(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const TravelPostScreen()));
                    },
                    icon: const Icon(Icons.add),
                ),
                ActionButtonSetting(
                  onPressed: (){
                    bool data = LocalStorage().getPartyData();

                    data == true ? LocalStorage().setPartyData(false) : LocalStorage().setPartyData(true);
                  },
                  icon: const Icon(Icons.autorenew),
                ),
              ],);
            }
            return Container();
          },
        )
      );
    }
    return Scaffold(
      appBar: isInAppbar ? AppBar(title: Text(title!),) : null,
      body:SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
                child: child
          )
      ),
    );
  }
}
