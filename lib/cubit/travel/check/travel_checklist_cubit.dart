import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/model/travel/todo/travel_todo_list_model.dart';
import 'package:nuri/repository/travel_checklist_repository.dart';

part 'travel_checklist_state.dart';

class TravelChecklistCubit extends Cubit<TravelChecklistState> {
  TravelChecklistCubit(this.travelChecklistRepository) : super(TravelChecklistState());

  final TravelChecklistRepository travelChecklistRepository;

  void getCheckList({required String travelId}) async{
    var result = await travelChecklistRepository.getChecklist(travelId: travelId);

    if(result.isNotEmpty){
      emit(TravelChecklistState(loadingStatus: LoadingStatus.success, travelTodoListModel: result));
    }
    if(result.isEmpty){
      emit(TravelChecklistState(loadingStatus: LoadingStatus.noData));
    }
  }

}
