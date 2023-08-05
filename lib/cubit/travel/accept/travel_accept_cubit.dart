import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/repository/travel_accept_repository.dart';

part 'travel_accept_state.dart';

class TravelAcceptCubit extends Cubit<TravelAcceptState> {
  TravelAcceptCubit(this.travelAcceptRepository) : super(TravelAcceptState());

  final TravelAcceptRepository travelAcceptRepository;

  void userAccept({required String userId, required bool respond, required int travelId}) async{
    var result = await travelAcceptRepository.userAccept(userId: userId, respond: respond, travelId: travelId);

  }

  void userApply({required int travelId}) async{
    var result = await travelAcceptRepository.userApply(travelId: travelId);
  }

}
