import 'package:bloc/bloc.dart';
import 'package:nuri/cubit/profile/profile_state.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/data/model/profile/profile_model.dart';
import 'package:nuri/repository/profile_repository.dart';


class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepository) : super(ProfileState());


  final ProfileRepository profileRepository;

  Future<ProfileModel?> getLocalData() async{
    return await ProfileState().profileModel;
  }

  void getUserProfileData() async{
    
    emit(ProfileState(loadingStatus: LoadingStatus.loading));

    final result = await profileRepository.getProfileInfo();

    LocalStorage().setName(result.userName);
    LocalStorage().setProfile(result.userProfile ?? "");

    emit(ProfileState(profileModel: result, loadingStatus: LoadingStatus.success));
    print(ProfileState().profileModel);
  }

  Future<bool> setProfileData({required String userName, String? bestTravel, String? introduce, String? image,required String fcmToken}) async{

    final result = await profileRepository.postProfileInfo(userName: userName, bestTravel:  bestTravel, introduce:  introduce, image: image,fcmToken: fcmToken);

    LocalStorage().setName(userName);
    LocalStorage().setProfile(image ?? "");

    emit(ProfileState( loadingStatus: LoadingStatus.success));

    return result;
  }

  void fetchProfileData({required String userName, String? bestTravel, String? introduce, String? image}) async{

    final result = await profileRepository.fetchProfileInfo(userName: userName, introduce: introduce, bestTravel: bestTravel, image: image);

  }


  void initUserProfileData(){
    emit(ProfileState());
  }

}
