part of 'travel_member_cubit.dart';


class TravelMemberState extends Equatable {

  TravelMemberState({this.loadingStatus = LoadingStatus.initial, this.userInfoModel});

  List<UserInfoModel>? userInfoModel;
  LoadingStatus loadingStatus;

  @override
  List<Object> get props => [];
}
