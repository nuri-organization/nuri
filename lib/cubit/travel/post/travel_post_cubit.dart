import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/model/travel/travel_post_model.dart';
import 'package:nuri/repository/travel_repository.dart';

part 'travel_post_state.dart';

class TravelPostCubit extends Cubit<TravelPostState> {
  TravelPostCubit(this.travelPostRepository) : super(TravelPostState());

  final TravelPostRepository travelPostRepository;

  void getTravelPostInfo() async{
    var result = await travelPostRepository.getTravelPostInfo();

    emit(TravelPostState(travelPostModel: result, loadingStatus: LoadingStatus.success));
  }

}
