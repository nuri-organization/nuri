part of 'travel_checklist_cubit.dart';

class TravelChecklistState extends Equatable {

  TravelChecklistState({this.loadingStatus = LoadingStatus.initial, this.travelTodoListModel});

  List<TravelTodoListModel>? travelTodoListModel;
  LoadingStatus loadingStatus;

  @override
  List<Object> get props => [];
}
