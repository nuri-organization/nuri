import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nuri/firebase_options.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
}

Future<String?> getFcmToken() async{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? firebaseToken = await messaging.getToken();
  return firebaseToken;
}

void _handleMessage(RemoteMessage message) {
  if (message.data['type'] == 'chat') {
    // Navigator.pushNamed(context, '/chat',
    //   arguments: ChatArguments(message),
    // );
  }
}

Future<void> fcmSetting() async{

  RemoteMessage? initalMessage = await FirebaseMessaging.instance.getInitialMessage();

  if(initalMessage != null){
    _handleMessage(initalMessage);
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true
  );

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true
  );



  final DarwinInitializationSettings initializationSettingsIOS =
  DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
  );

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "nuri_notification",
    "nuri_notification",
    description: "nuri notification",
    importance: Importance.max
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

  FirebaseMessaging.onMessage.listen((RemoteMessage message){
    print("gaiojnfverbltieg.enb.s");
    // RemoteNotification? notification = message.notification;
    // AndroidNotification? android = message.notification?.android;
    //
    // // If `onMessage` is triggered with a notification, construct our own
    // // local notification to show to users using the created channel.
    // if (notification != null && android != null) {
    //   flutterLocalNotificationsPlugin.show(
    //       notification.hashCode,
    //       notification.title,
    //       notification.body,
    //       NotificationDetails(
    //         android: AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //           channelDescription: channel.description,
    //           // icon: 'nuri_icon.png',
    //         ),
    //       ));
    // }
  });
}
