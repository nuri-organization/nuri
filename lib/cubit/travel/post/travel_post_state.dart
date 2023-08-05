part of 'travel_post_cubit.dart';

class TravelPostState extends Equatable {

  TravelPostState({this.travelPostModel, this.loadingStatus = LoadingStatus.initial});

  List<TravelPostModel>? travelPostModel;
  LoadingStatus loadingStatus;

  @override
  List<Object?> get props => [travelPostModel, loadingStatus];
}
