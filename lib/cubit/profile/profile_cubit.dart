import 'package:bloc/bloc.dart';
import 'package:nuri/cubit/profile/profile_state.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/model/profile/profile_model.dart';


class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());


  void getUserProfileData({required ProfileModel profileModel, required LoadingStatus loadingStatus}){
    emit(ProfileState(profileModel: profileModel,loadingStatus: loadingStatus));
  }

  void initUserProfileData(){
    emit(ProfileState());
  }

}
