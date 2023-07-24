import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/config/provider_di.dart';
import 'package:nuri/home.dart';
import 'package:nuri/nuri_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  Bloc.observer = NuriObserver();

  initApp();

  runApp(const NuriApp());
}

Future<void> initApp() async{

  await Hive.initFlutter();
  await Hive.openBox(Constants.hiveBoxName);
}

class NuriApp extends StatelessWidget {
  const NuriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
        builder: (context, child){
          return MultiBlocProvider(
            providers: getProvider(),
            child: MaterialApp(
              theme: ThemeData(
                fontFamily: "maple",
                primaryColor: Constants.theme4,
                primarySwatch: Colors.orange
              ),
              home: const HomePage(),
            ),
          );
        }
    );
  }
}
