import 'package:nuri/data/model/post/comment/comment_model.dart';
import 'package:nuri/data/remote/shortory/comment/comment_api.dart';

abstract class CommentRepository{
  Future<List<CommentModel>> getCommentInfo({required int postId});
  Future<bool> postCommentInfo({required CommentModel commentModel});
  Future<bool> fetchCommentInfo({required CommentModel commentModel});
  Future<bool> deleteCommentInfo({required CommentModel commentModel});
}

class CommentRepositoryImpl extends CommentRepository{

  CommentApi api;
  CommentRepositoryImpl(this.api);

  @override
  Future<bool> fetchCommentInfo({required CommentModel commentModel}) async{

    final bool result = await api.fetchCommentInfo(commentModel: commentModel);

    return result;
  }

  @override
  Future<List<CommentModel>> getCommentInfo({required int postId}) async{
    final List<CommentModel> result = await api.getCommentInfo(postId: postId);

    return result;
  }

  @override
  Future<bool> postCommentInfo({required CommentModel commentModel}) async{

    final bool result = await api.postCommentInfo(commentModel: commentModel);

    return result;
  }

  @override
  Future<bool> deleteCommentInfo({required CommentModel commentModel}) async{

    final bool result = await api.deleteCommentInfo(commentModel: commentModel);

    return result;
  }

}