import 'package:hive_flutter/hive_flutter.dart';
import 'package:nuri/config/constants.dart';

class LocalStorage{

  final box = Hive.box(Constants.hiveBoxName);

  LocalStorage._privateConstructor();
  static final LocalStorage _instance = LocalStorage._privateConstructor();

  factory LocalStorage(){
    return _instance;
  }

  String _userIdTokenKey = "userIdToken";
  String _isHaveParty = "isHaveParty";
  String _userNameKey = "userName";
  String _userProfileKey = "userProfile";
  String _userTravelKey = "userTravel";

  String getUserIdToken(){
    return (box.get(_userIdTokenKey) ?? "").toString();
  }

  Future<void> setUserIdToken(String token) async{
    await box.put(_userIdTokenKey, token);
  }

  String getName(){
    return (box.get(_userNameKey) ?? "").toString();
  }

  Future<void> setName(String token) async{
    await box.put(_userNameKey, token);
  }

  String getProfile(){
    return (box.get(_userProfileKey) ?? "").toString();
  }

  Future<void> setProfile(String token) async{
    await box.put(_userProfileKey, token);
  }

  bool getPartyData(){
    return (box.get(_isHaveParty) ?? false);
  }

  Future<void> setPartyData(bool data) async{
    await box.put(_isHaveParty, data);
  }

  String getTravelId(){
    return (box.get(_userTravelKey) ?? "").toString();
  }

  Future<void> setTravelId(String token) async{
    await box.put(_userTravelKey, token);
  }

}