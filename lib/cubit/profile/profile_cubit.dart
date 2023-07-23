import 'package:bloc/bloc.dart';
import 'package:nuri/cubit/profile/profile_state.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/repository/profile_repository.dart';


class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepository) : super(ProfileState());


  final ProfileRepository profileRepository;

  void getUserProfileData() async{

    final result = await profileRepository.getProfileInfo();

    emit(ProfileState(profileModel: result, loadingStatus: LoadingStatus.success));
  }

  void initUserProfileData(){
    emit(ProfileState());
  }

}
