import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/model/travel/travel_my_model.dart';
import 'package:nuri/repository/travel_member_repository.dart';

part 'travel_my_travel_state.dart';

class TravelMyTravelCubit extends Cubit<TravelMyTravelState> {
  TravelMyTravelCubit(this.travelMemberRepository) : super(TravelMyTravelState());

  final TravelMemberRepository travelMemberRepository;

  void getMyTravel() async {
    List<TravelMyModel> result = await travelMemberRepository.getMyTravel();

    if (result.isEmpty) {
      emit(TravelMyTravelState(loadingStatus: LoadingStatus.noData));
    }
    if (result.isNotEmpty) {
      emit(TravelMyTravelState(loadingStatus: LoadingStatus.success, travelMyModel: result));
    }
  }
}
