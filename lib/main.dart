import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/config/fcm_setting.dart';
import 'package:nuri/config/provider_di.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/home.dart';
import 'package:nuri/nuri_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = NuriObserver();

  await initApp();

  runApp(const NuriApp());
}

Future<void> initApp() async{

  await Hive.initFlutter();
  await Hive.openBox(Constants.hiveBoxName);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await fcmSetting();

  // fcm 토큰 값 받아와서 저장
  String? firebaseToken = await getFcmToken();

  LocalStorage().setUserFcmToken(firebaseToken);
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
