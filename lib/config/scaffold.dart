import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/ui/screen/notification/notification_screen.dart';
import 'package:nuri/ui/screen/shortory/shortory_post_screen.dart';
import 'package:nuri/ui/screen/travel/travel_post_screen.dart';
import 'package:nuri/ui/common/action_button.dart';
import 'package:nuri/ui/common/bottom_nav/bottomnav_router.dart';
import 'package:nuri/ui/common/bottom_nav/bottomnav_state.dart';
import 'package:nuri/ui/common/bottom_nav/navigation_cubit.dart';
import 'package:nuri/ui/common/bottom_nav/nuri_bottomnavigation_constants.dart';
import 'package:nuri/ui/common/nuri_material.dart';

// ignore: must_be_immutable
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
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Container(height: 0.1, width: double.infinity, color: Colors.black,),
                NuriTextButton(
                  title: "로그아웃",
                  textStyle: TextStyle(
                      fontSize: Constants.fontSizedNormal.sp,
                      color: Colors.red
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
              "누리",
              style: TextStyle(
                  fontSize: Constants.fontSizedBig.sp
              )
          ),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const NotificationScreen()
                      )
                  );
                },
                icon: const Icon(Icons.notifications)
            )
          ],
        ),
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
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (BuildContext context) => const ShortoryPostScreen()
                         )
                     );
                   },
                   icon: const Icon(Icons.add)
               )
             ],);
            }
            if(state.index == 1){
              return ActionButton(children: [
                ActionButtonSetting(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const TravelPostScreen()
                          )
                      );
                    },
                    icon: const Icon(Icons.add),
                ),
              ],);
            }
            return Container();
          },
        )
      );
    }
    return Scaffold(
      appBar: isInAppbar
          ? AppBar(
              title: Text(
                title!,
                style: TextStyle(fontSize: Constants.fontSizedBig.sp),
              ),
            )
          : null,
      body:SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
                child: child
          ),
      ),
    );
  }
}
