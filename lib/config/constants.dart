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
}