import 'package:nuri/data/model/profile/profile_model.dart';
import 'package:nuri/data/remote/user_profile/user_profile_api.dart';

abstract class ProfileRepository{
  Future<ProfileModel> getProfileInfo();
  Future<bool> fetchProfileInfo({required ProfileModel profileModel});
  Future<bool> postProfileInfo({required String userName, String? bestTravel, String? introduce});
}

class ProfileRepositoryImpl extends ProfileRepository{

  UserProfileApi api;
  ProfileRepositoryImpl(this.api);

  @override
  Future<bool> fetchProfileInfo({required ProfileModel profileModel}) async{

    final bool result = await api.fetchUserProfile(profileModel: profileModel);

    return result;
  }

  @override
  Future<ProfileModel> getProfileInfo() async{

    ProfileModel result = await api.getUserProfileInfo();

    return result;
  }

  @override
  Future<bool> postProfileInfo({required String userName, String? bestTravel, String? introduce}) async{

    final bool result = await api.postUserProfile(userName: userName, bestTravel:  bestTravel, introduce:  introduce);

    return result;

  }

}