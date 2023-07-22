import 'package:nuri/data/model/post/post_model.dart';
import 'package:nuri/data/remote/shortory/shortory_post_api.dart';

abstract class ShortoryPostRepository{
  Future<List<PostModel>> getShortoryPostInfo();
  Future<bool> postShortoryPostInfo({required PostModel postModel});
  Future<bool> fetchShortoryPostInfo({required PostModel postModel});
}

class ShortoryPostRepositoryImpl extends ShortoryPostRepository{
  ShortoryPostApi api;
  ShortoryPostRepositoryImpl(this.api);

  @override
  Future<bool> fetchShortoryPostInfo({required PostModel postModel}) async{

    final bool result = await api.fetchPostInfo(postModel: postModel);

    return result;
  }

  @override
  Future<List<PostModel>> getShortoryPostInfo() async{

    final List<PostModel> result = await api.getPostInfo();

    return result;
  }

  @override
  Future<bool> postShortoryPostInfo({required PostModel postModel}) async{

    final bool result = await api.fetchPostInfo(postModel: postModel);

    return result;
  }

}