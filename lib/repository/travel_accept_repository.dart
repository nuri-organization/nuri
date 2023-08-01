import 'package:nuri/data/remote/travel/travel_accept_api.dart';

abstract class TravelAcceptRepository{
  Future<bool> userAccept({required String userId,required bool respond, required int travelId});
}

class TravelAcceptRepositoryImpl extends TravelAcceptRepository{

  TravelAcceptApi api;
  TravelAcceptRepositoryImpl(this.api);

  @override
  Future<bool> userAccept({required String userId, required bool respond, required int travelId}) async{
    final bool result = await api.userAccept(userId: userId, respond: respond, travelId: travelId);

    return true;
  }

}