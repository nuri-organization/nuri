import 'package:provider/single_child_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/ui/widget/bottom_nav/navigation_cubit.dart';

List<SingleChildWidget> getProvider() {


  NavigationCubit navigationCubit = NavigationCubit();

  return [
    BlocProvider<NavigationCubit>(create: (BuildContext context) => navigationCubit)
  ];
}