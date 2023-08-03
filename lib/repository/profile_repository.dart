import 'package:nuri/data/model/profile/profile_model.dart';
import 'package:nuri/data/remote/user_profile/user_profile_api.dart';

abstract class ProfileRepository{
  Future<ProfileModel> getProfileInfo();
  Future<bool> fetchProfileInfo({required String userName, String? bestTravel, String? introduce, String? image});
  Future<bool> postProfileInfo({required String userName, String? bestTravel, String? introduce, String? image,required String fcmToken});
}

class ProfileRepositoryImpl extends ProfileRepository{

  UserProfileApi api;
  ProfileRepositoryImpl(this.api);

  @override
  Future<bool> fetchProfileInfo({required String userName, String? bestTravel, String? introduce, String? image}) async{

    final bool result = await api.fetchUserProfile(userName: userName, bestTravel: bestTravel, introduce: introduce, image: image);

    return result;
  }

  @override
  Future<ProfileModel> getProfileInfo() async{

    ProfileModel result = await api.getUserProfileInfo();

    return result;
  }

  @override
  Future<bool> postProfileInfo({required String userName, String? bestTravel, String? introduce, String? image, required String fcmToken}) async{

    final bool result = await api.postUserProfile(userName: userName, bestTravel:  bestTravel, introduce:  introduce, image: image,fcmToken: fcmToken);

    return result;

  }

}