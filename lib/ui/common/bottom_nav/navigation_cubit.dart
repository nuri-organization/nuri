import 'package:bloc/bloc.dart';
import 'package:nuri/ui/common/bottom_nav/bottomnav_state.dart';
import 'package:nuri/ui/common/bottom_nav/nuri_bottomnavigation_constants.dart';

class NavigationCubit extends Cubit<NavigationState>{
  NavigationCubit() : super(NavigationState(0, NavBarItem.shortory));

  void getNavBarItem(int index){
    switch (index){
      case 0 :
        emit(NavigationState(0, NavBarItem.shortory));
        break;
      case 1 :
        emit(NavigationState(1, NavBarItem.travel));
        break;
      case 2 :
        emit(NavigationState(2, NavBarItem.chat));
        break;
      case 3 :
        emit(NavigationState(3, NavBarItem.profile));
        break;
    }
  }
}