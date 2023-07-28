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
  String isHaveParty = "isHaveParty";

  String getUserIdToken(){
    return (box.get(_userIdTokenKey) ?? "").toString();
  }

  Future<void> setUserIdToken(String token) async{
    await box.put(_userIdTokenKey, token);
  }

  bool getPartyData(){
    return (box.get(isHaveParty) ?? false);
  }

  Future<void> setPartyData(bool data) async{
    await box.put(isHaveParty, data);
  }

}