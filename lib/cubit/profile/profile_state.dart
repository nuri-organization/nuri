import 'package:equatable/equatable.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/model/profile/profile_model.dart';

class ProfileState extends Equatable {
  ProfileState({this.profileModel, this.loadingStatus = LoadingStatus.initial});

  ProfileModel? profileModel;
  LoadingStatus loadingStatus;

  @override
  List<Object?> get props => [profileModel,loadingStatus];

}
