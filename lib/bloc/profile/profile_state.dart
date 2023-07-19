import 'package:nuri/data/model/profile/profile_model.dart';
import 'package:nuri/test/profile_data.dart';

class ProfileState{
  final ProfileModel profileModel;

  ProfileState({required this.profileModel});

  factory ProfileState.empty(){
    return ProfileState(
        profileModel: TestProfileData().data1
    );
  }
}