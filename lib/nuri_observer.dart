import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class NuriObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    debugPrint("${bloc.runtimeType} $change");
  }
}