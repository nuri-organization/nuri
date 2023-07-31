import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/model/profile/user_info/user_info_model.dart';
import 'package:nuri/repository/travel_member_repository.dart';

part 'travel_member_state.dart';

class TravelMemberCubit extends Cubit<TravelMemberState> {
  TravelMemberCubit(this.travelMemberRepository) : super(TravelMemberState());

  final TravelMemberRepository travelMemberRepository;

  void getMember({required String travelId}) async{
    var result = await travelMemberRepository.getTravelMember(travelId: travelId);

    if(result.isEmpty){
      emit(TravelMemberState(loadingStatus: LoadingStatus.noData));
    }
    if(result.isNotEmpty){
      emit(TravelMemberState(loadingStatus: LoadingStatus.success, userInfoModel: result));
    }
  }

}
