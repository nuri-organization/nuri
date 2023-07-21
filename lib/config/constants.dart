import 'dart:ui';

class Constants{

  Constants._privateConstructor();
  static final Constants _instance = Constants._privateConstructor();

  factory Constants(){
    return _instance;
  }

  static bool isDevelopMode = true;

  static String appName = "누리";
  static String baseServerUrl = isDevelopMode
      ? ""
      : "";

  static const theme1 = Color(0xFFFCE8C9);
  static const theme2 = Color(0xFFFFE3AD);
  static const theme3 = Color(0xFFFEE092);
  static const theme4 = Color(0xFFFFB966);

}