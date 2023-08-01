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

    print("result : $result");

    if(result.isEmpty){
      emit(TravelPostState(loadingStatus: LoadingStatus.noData));
    }
    if(result.isNotEmpty){
      emit(TravelPostState(travelPostModel: result, loadingStatus: LoadingStatus.success));
    }

  }

  void postTravelPostInfo({required String title, required String content, required List<String> mainTravel, required int cost, required String startData, required String endDate, required int maxPeople}) async{
    var result = await travelPostRepository.postTravelPostInfo(title: title,cost:cost,content: content,maxPeople: maxPeople,mainTravel: mainTravel,startData: startData,endDate: endDate);


  }

}
