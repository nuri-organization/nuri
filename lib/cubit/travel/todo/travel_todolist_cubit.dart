import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/model/travel/todo/travel_todo_list_model.dart';
import 'package:nuri/repository/travel_todolist_repository.dart';

part 'travel_todolist_state.dart';

class TravelTodolistCubit extends Cubit<TravelTodolistState> {
  TravelTodolistCubit(this.travelTodolistRepository) : super(TravelTodolistState());

  final TravelTodolistRepository travelTodolistRepository;

  void getTodoList({required String travelId}) async{
    var result = await travelTodolistRepository.getTodolist(travelId: travelId);

    if(result.isNotEmpty){
      emit(TravelTodolistState(loadingStatus: LoadingStatus.success, travelTodoListModel: result));
    }
    if(result.isEmpty){
      emit(TravelTodolistState(loadingStatus: LoadingStatus.noData));
    }
  }

}
