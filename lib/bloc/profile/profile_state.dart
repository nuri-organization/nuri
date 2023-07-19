import 'package:nuri/data/model/profile/profile_model.dart';

class ProfileState{
  final ProfileModel profileModel;

  ProfileState({required this.profileModel});

  factory ProfileState.empty(){
    return ProfileState(
        profileModel: ProfileModel(
          userName: 'yasuo',
          userProfile: null,
          introduce: 'hello',
          bestTravel: 'jeju',
          postAmount: 0,
          flower: 0,
          flowing: 0,
          posts: [null]
        )
    );
  }
}