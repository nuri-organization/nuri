part of 'travel_todolist_cubit.dart';


class TravelTodolistState extends Equatable {

  TravelTodolistState({this.loadingStatus = LoadingStatus.initial, this.travelTodoListModel});

  List<TravelTodoListModel>? travelTodoListModel;
  LoadingStatus loadingStatus;

  @override
  List<Object> get props => [];
}
