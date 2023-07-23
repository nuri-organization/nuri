import 'package:nuri/data/model/travel/travel_post_model.dart';
import 'package:nuri/data/remote/travel/travel_post_api.dart';

abstract class TravelPostRepository{
  Future<List<TravelPostModel>> getTravelPostInfo();
  Future<bool> postTravelPostInfo({required TravelPostModel travelPostModel});
  Future<bool> fetchTravelPostInfo({required TravelPostModel travelPostModel});
}

class TravelPostRepositoryImpl extends TravelPostRepository{

  TravelPostApi api;
  TravelPostRepositoryImpl(this.api);

  @override
  Future<bool> fetchTravelPostInfo({required TravelPostModel travelPostModel}) async{

    final bool result = await api.fetchTravelPostInfo(travelPostModel: travelPostModel);

    return result;
  }

  @override
  Future<List<TravelPostModel>> getTravelPostInfo() async{

    final List<TravelPostModel> result = await api.getTravelPostInfo();

    return result;
  }

  @override
  Future<bool> postTravelPostInfo({required TravelPostModel travelPostModel}) async{

    final bool result = await api.postTravelPostInfo(travelPostModel: travelPostModel);

    return result;
  }

}