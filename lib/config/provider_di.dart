import 'package:nuri/bloc/profile/profile_bloc.dart';
import 'package:nuri/bloc/profile/profile_state.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/ui/widget/bottom_nav/navigation_cubit.dart';

List<SingleChildWidget> getProvider() {


  NavigationCubit navigationCubit = NavigationCubit();
  ProfileBloc profileBloc = ProfileBloc(ProfileState.empty());

  return [
    BlocProvider<NavigationCubit>(create: (BuildContext context) => navigationCubit),
    BlocProvider<ProfileBloc>(create: (_) => profileBloc),
  ];
}