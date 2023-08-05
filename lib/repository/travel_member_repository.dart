import 'package:nuri/data/model/profile/user_info/user_info_model.dart';
import 'package:nuri/data/model/travel/travel_my_model.dart';
import 'package:nuri/data/remote/travel/travel_member_api.dart';

abstract class TravelMemberRepository{
  Future<List<UserInfoModel>> getTravelMember({required String travelId});
  Future<bool> delTravelMember({required String travelId});
  Future<List<TravelMyModel>> getMyTravel();
}

class TravelMemberRepositoryImpl extends TravelMemberRepository{

  TravelMemberApi api;
  TravelMemberRepositoryImpl(this.api);

  @override
  Future<bool> delTravelMember({required String travelId}) async{
    final bool result = await api.delTravelMember(travelId: travelId);

    return true;
  }

  @override
  Future<List<UserInfoModel>> getTravelMember({required String travelId}) async{
    final List<UserInfoModel> result = await api.getTravelMember(travelId: travelId);

    return result;
  }

  @override
  Future<List<TravelMyModel>> getMyTravel() async{
    final List<TravelMyModel> result = await api.getMyTravel();

    return result;
  }

}