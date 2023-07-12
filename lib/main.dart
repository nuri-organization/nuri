import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/home.dart';
import 'package:nuri/nuri_observer.dart';

void main() {
  Bloc.observer = NuriObserver();
  runApp(const NuriApp());
}

class NuriApp extends StatelessWidget {
  const NuriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
        builder: (context, child){
          return MaterialApp(
            theme: ThemeData(
              fontFamily: "maple"
            ),
            home: HomePage(),
          );
        }
    );
  }
}
