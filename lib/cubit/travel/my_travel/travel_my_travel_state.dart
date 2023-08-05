part of 'travel_my_travel_cubit.dart';

class TravelMyTravelState extends Equatable {
  TravelMyTravelState({this.loadingStatus = LoadingStatus.initial, this.travelMyModel});

  List<TravelMyModel>? travelMyModel;
  LoadingStatus loadingStatus;

  @override
  List<Object?> get props => [loadingStatus,travelMyModel];
}
